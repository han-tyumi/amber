import * as fs from "@std/fs";
import * as path from "@std/path";
import { build, type Plugin } from "esbuild";

import denoConfig from "./deno.json" with { type: "json" };

const srcDir = path.resolve("src");
const buildDir = path.resolve("build/dev/javascript/amber");

const entryPointFiles = fs.expandGlob(path.joinGlobs([srcDir, "**/*.ffi.ts"]), {
  extended: false,
  includeDirs: false,
});

const entryPoints = await Array.fromAsync(entryPointFiles, (entry) => {
  const { dir, name } = path.parse(path.relative(srcDir, entry.path));
  return {
    in: entry.path,
    out: path.resolve(srcDir, path.join(dir, name).replaceAll("/", "__")),
  };
});

const buildImportMapper: Plugin = {
  name: "build-import-mapper",
  setup: (build) => {
    const buildImportRegex = /^\$\//;
    const buildImportPath = path.relative(buildDir, denoConfig.imports["$/"]);

    build.onResolve({ filter: buildImportRegex }, (args) => {
      const relativePath = path.relative(
        buildDir,
        path.resolve(
          buildDir,
          path.join(buildImportPath, args.path.replace(buildImportRegex, "")),
        ),
      );

      return {
        path: (relativePath.startsWith(".") ? "" : "./") + relativePath,
        external: true,
      };
    });
  },
};

await build({
  entryPoints,
  platform: "neutral",
  outdir: srcDir,
  outExtension: { ".js": ".mjs" },
  target: "es2024",
  bundle: true,
  splitting: true,
  alias: { "~": denoConfig.imports["~/"] },
  plugins: [buildImportMapper],
});
