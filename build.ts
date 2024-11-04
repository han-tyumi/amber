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
    externalAlias({
      "$/": relativeImportPath(gleamOutDir, denoConfig.imports["$/"]),
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

function relativeImportPath(from: string, to: string): string {
  const relativePath = path.relative(from, to);
  const hasLeadingDot = relativePath.startsWith(".");
  const isDir = path.extname(relativePath) === "";
  return `${hasLeadingDot ? "" : "./"}${relativePath}${isDir ? "/" : ""}`;
}

function externalAlias(aliases: Record<string, string>): Plugin {
  return {
    name: "external-alias",
    setup: (build) => {
      for (const [moduleSpecifier, resolvedPath] of Object.entries(aliases)) {
        const hasPrefix = moduleSpecifier.endsWith("/");
        const moduleSpecifierPattern = new RegExp(
          `^${regexp.escape(moduleSpecifier)}${hasPrefix ? "" : "$"}`,
        );

        build.onResolve({ filter: moduleSpecifierPattern }, (args) => ({
          path: args.path.replace(moduleSpecifierPattern, resolvedPath),
          external: true,
        }));
      }
    },
  };
}
