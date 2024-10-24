import * as $fileInfo from "amber/fs/file_info.mjs";
import { toOption } from "../../utils/option.ts";

export function toGleamFileInfo(fileInfo: Deno.FileInfo): $fileInfo.FileInfo {
  return new $fileInfo.FileInfo(
    fileInfo.isFile,
    fileInfo.isDirectory,
    fileInfo.isSymlink,
    fileInfo.size,
    toOption(fileInfo.mtime),
    toOption(fileInfo.atime),
    toOption(fileInfo.birthtime),
    fileInfo.dev,
    toOption(fileInfo.ino),
    toOption(fileInfo.mode),
    toOption(fileInfo.nlink),
    toOption(fileInfo.uid),
    toOption(fileInfo.gid),
    toOption(fileInfo.rdev),
    toOption(fileInfo.blksize),
    toOption(fileInfo.blocks),
    toOption(fileInfo.isBlockDevice),
    toOption(fileInfo.isCharDevice),
    toOption(fileInfo.isFifo),
    toOption(fileInfo.isSocket),
  );
}
