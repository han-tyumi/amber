import * as fs from "@std/fs";
import * as path from "@std/path";
import * as regexp from "@std/regexp";
import { build, type BuildOptions, type Plugin } from "esbuild";

import denoConfig from "./deno.json" with { type: "json" };

const cwd = Deno.cwd();
const srcDir = path.resolve(cwd, "src");
const entryPointsGlob = path.joinGlobs([srcDir, "**/*.ffi.ts"]);
const gleamOutDir = path.resolve(cwd, "build/dev/javascript/amber");
const outDir = srcDir;

await build({
  entryPoints: await entryPoints(entryPointsGlob, srcDir, outDir),
  platform: "neutral",
  outdir: outDir,
  outExtension: { ".js": ".mjs" },
  target: "es2024",
  bundle: true,
  splitting: true,
  alias: {
    "~": denoConfig.imports["~/"],
  },
  plugins: [
    externalImportMap({
      cwd: gleamOutDir,
      importMap: {
        "$/": path.resolve(denoConfig.imports["$/"]),
      },
    }),
  ],
});

function entryPoints(
  entryPointsGlob: string,
  srcDir: string,
  outDir: string,
): Promise<BuildOptions["entryPoints"]> {
  const entriesPromise = fs.expandGlob(entryPointsGlob, {
    extended: false,
    includeDirs: false,
  });

  return Array.fromAsync(entriesPromise, ({ path: inPath }) => {
    const relInPath = path.relative(srcDir, inPath);
    const { dir: relInDir, name: inName } = path.parse(relInPath);
    const outBase = path.join(relInDir, inName).replaceAll("/", "__");
    const outPath = path.resolve(outDir, outBase);
    return { in: inPath, out: outPath };
  });
}

function externalImportMap(
  { cwd, importMap }: { cwd: string; importMap: Record<string, string> },
): Plugin {
  return {
    name: "external-import-map",
    setup: (build) => {
      for (const [moduleSpecifier, resolvedPath] of Object.entries(importMap)) {
        const isDir = moduleSpecifier.endsWith("/");
        const moduleSpecifierPattern = new RegExp(
          `^${regexp.escape(moduleSpecifier)}` + (isDir ? "" : "$"),
        );
        const relResolvedPath = path.relative(cwd, resolvedPath);

        build.onResolve({ filter: moduleSpecifierPattern }, (args) => {
          const replacedPath = path.join(
            relResolvedPath,
            args.path.replace(moduleSpecifierPattern, ""),
          );
          const absolutePath = path.resolve(cwd, replacedPath);
          const relativePath = path.relative(cwd, absolutePath);

          return {
            path: formalizePath(relativePath),
            external: true,
          };
        });
      }
    },
  };
}

function formalizePath(filePath: string) {
  const hasLeadingDot = filePath.startsWith(".");
  const hasTrailingSlash = filePath.endsWith("/");
  const isDir = path.extname(filePath) === "";
  return (hasLeadingDot ? "" : "./") + filePath +
    (isDir && !hasTrailingSlash ? "/" : "");
}
