const denoVersion = Deno.version.deno;
const changelog = Deno.readTextFileSync("CHANGELOG.md");
const updated = changelog.replace(
  /^(## \S+.*\n)/m,
  `$1\nTested against Deno ${denoVersion}.\n`,
);
Deno.writeTextFileSync("CHANGELOG.md", updated);
