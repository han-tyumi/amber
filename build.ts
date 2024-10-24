import * as fs from "@std/fs";
import * as path from "@std/path";
import * as regexp from "@std/regexp";
import { build, type BuildOptions, type Plugin } from "esbuild";

import denoConfig from "./deno.json" with { type: "json" };

const cwd = Deno.cwd();
const src = path.resolve(cwd, "src");
const buildCwd = path.resolve(cwd, "build/dev/javascript/amber");

await build({
  entryPoints: await entryPoints(),
  platform: "neutral",
  outdir: "src",
  outExtension: { ".js": ".mjs" },
  bundle: true,
  splitting: true,
  plugins: [
    useImportMap(
      relativeImportMap(buildCwd, denoConfig.imports),
    ),
  ],
});

function entryPoints(): Promise<BuildOptions["entryPoints"]> {
  const entriesPromise = fs.expandGlob("src/**/*_ffi.ts", {
    extended: false,
    includeDirs: false,
  });

  return Array.fromAsync(entriesPromise, ({ path: inPath }) => {
    const inRelativeToSrc = path.relative(src, inPath);
    const { dir: inDir, name: inName } = path.parse(inRelativeToSrc);
    const relativeOutBase = path.join(inDir, inName).replaceAll("/", "__");
    const outBase = path.resolve(src, relativeOutBase);
    return { in: inPath, out: outBase };
  });
}

function relativeImportMap(
  from: string,
  importMap: Record<string, string>,
): Record<string, string> {
  const localImportMapEntries = Object.entries(importMap)
    .filter(([_moduleSpecifier, resolvedPath]) => resolvedPath.startsWith("."));

  const relativeImportMapEntries = localImportMapEntries
    .map(([moduleSpecifier, localPath]) => {
      const relativePath = path.relative(from, localPath);
      const hasLeadingDot = relativePath.startsWith(".");
      const isDir = path.extname(relativePath) === "";
      return [
        moduleSpecifier,
        `${hasLeadingDot ? "" : "./"}${relativePath}${isDir ? "/" : ""}`,
      ];
    });

  return Object.fromEntries(relativeImportMapEntries);
}

function useImportMap(importMap: Record<string, string>): Plugin {
  return {
    name: "use-import-map",
    setup: (build) => {
      for (const [moduleSpecifier, resolvedPath] of Object.entries(importMap)) {
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
