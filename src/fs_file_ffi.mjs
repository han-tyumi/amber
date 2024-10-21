// @ts-check

/**
 * @import { None, Some } from "gleam/option.mjs";
 * @import { Current, End, Start } from "amber/fs/seek_mode.mjs";
 * @import { Cbreak } from "amber/fs/set_raw.mjs";
 */

import * as $seek_mode from "amber/fs/seek_mode.mjs";
import * as $set_raw from "amber/fs/set_raw.mjs";
import * as $option from "gleam/option.mjs";

import {
  enumToString,
  flag,
  lazyMap,
  optionsFromList,
  resultFromNullable,
} from "./ffi_util.mjs";
import { objectToFileInfo } from "./fs_ffi.mjs";

/**
 * @template T
 * @typedef {Some | None} Option
 */

/** @typedef {Start | Current | End} SeekMode */

/** @typedef {Cbreak} SetRawOption */

/**
 * @param {Deno.FsFile} file
 */
export function readable(file) {
  return file.readable;
}

/**
 * @param {Deno.FsFile} file
 */
export function writable(file) {
  return file.writable;
}

/**
 * @param {Deno.FsFile} file
 * @param {any} p
 */
export function write_sync(file, p) {
  return file.writeSync(p);
}

/**
 * @param {Deno.FsFile} file
 * @param {Option<number>} len
 */
export function truncate_sync(file, len) {
  return file.truncateSync($option.unwrap(len));
}

/**
 * @param {Deno.FsFile} file
 * @param {any} p
 */
export function read_sync(file, p) {
  return resultFromNullable(file.readSync(p));
}

const seekModeMap = lazyMap(
  [$seek_mode.Start, 0],
  [$seek_mode.Current, 1],
  [$seek_mode.End, 2],
);

/**
 * @param {Deno.FsFile} file
 * @param {number} offset
 * @param {SeekMode} whence
 */
export function seek_sync(file, offset, whence) {
  return file.seekSync(offset, enumToString(seekModeMap)(whence));
}

/**
 * @param {Deno.FsFile} file
 */
export function stat_sync(file) {
  return objectToFileInfo(file.statSync());
}

/**
 * @param {Deno.FsFile} file
 */
export function sync_sync(file) {
  return file.syncSync();
}

/**
 * @param {Deno.FsFile} file
 */
export function sync_data_sync(file) {
  return file.syncDataSync();
}

/**
 * @param {Deno.FsFile} file
 * @param {number} atime
 * @param {number} mtime
 */
export function utime_sync(file, atime, mtime) {
  return file.utimeSync(atime, mtime);
}

/**
 * @param {Deno.FsFile} file
 */
export function is_terminal(file) {
  return file.isTerminal();
}

const setRawOptionMap = lazyMap(
  [$set_raw.Cbreak, flag("cbreak")],
);

/**
 * @param {Deno.FsFile} file
 * @param {boolean} mode
 * @param {SetRawOption[]} options
 */
export function set_raw(file, mode, options) {
  // @ts-ignore: need to add typings to ffi_util.mjs
  return file.setRaw(mode, optionsFromList(options, setRawOptionMap));
}

/**
 * @param {Deno.FsFile} file
 * @param {boolean} exclusive
 */
export function lock_sync(file, exclusive) {
  return file.lockSync(exclusive);
}

/**
 * @param {Deno.FsFile} file
 */
export function unlock_sync(file) {
  return file.unlockSync();
}

/**
 * @param {Deno.FsFile} file
 */
export function close(file) {
  return file.close();
}
