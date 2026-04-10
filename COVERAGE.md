# Coverage

amber provides Gleam bindings for [Deno](https://deno.com/) runtime APIs. At the
moment, only stable APIs are targeted. Deprecated and unstable/experimental APIs
(those requiring `--unstable-*` flags) are excluded for now.

## Source

All API coverage is based on the
[Deno API reference](https://docs.deno.com/api/deno/), organized by their
namespace categories.

## Deno Version

Developed and tested against **Deno 2.7**. Each amber release will note the Deno
version it was tested against.

## Legend

- ✅ All stable members bound
- 🚧 Module exists, some members missing
- ❌ No module yet

## File System

| API                    | Status | Module          | Notes                 |
| ---------------------- | ------ | --------------- | --------------------- |
| Deno.openSync          | ✅     | `amber`         |                       |
| Deno.open              | ❌     | —               | Async variant         |
| Deno.createSync        | ✅     | `amber`         |                       |
| Deno.create            | ❌     | —               | Async variant         |
| Deno.readFileSync      | ✅     | `amber`         |                       |
| Deno.readFile          | ❌     | —               | Async variant         |
| Deno.readTextFileSync  | ✅     | `amber`         |                       |
| Deno.readTextFile      | ❌     | —               | Async variant         |
| Deno.writeFileSync     | ✅     | `amber`         |                       |
| Deno.writeFile         | ❌     | —               | Async variant         |
| Deno.writeTextFileSync | ✅     | `amber`         |                       |
| Deno.writeTextFile     | ❌     | —               | Async variant         |
| Deno.mkdirSync         | ✅     | `amber`         |                       |
| Deno.mkdir             | ❌     | —               | Async variant         |
| Deno.removeSync        | ✅     | `amber`         |                       |
| Deno.remove            | ❌     | —               | Async variant         |
| Deno.renameSync        | ✅     | `amber`         |                       |
| Deno.rename            | ❌     | —               | Async variant         |
| Deno.copyFileSync      | ✅     | `amber`         |                       |
| Deno.copyFile          | ❌     | —               | Async variant         |
| Deno.statSync          | ✅     | `amber`         |                       |
| Deno.stat              | ❌     | —               | Async variant         |
| Deno.lstatSync         | ✅     | `amber`         |                       |
| Deno.lstat             | ❌     | —               | Async variant         |
| Deno.linkSync          | ✅     | `amber`         |                       |
| Deno.link              | ❌     | —               | Async variant         |
| Deno.symlinkSync       | ✅     | `amber`         |                       |
| Deno.symlink           | ❌     | —               | Async variant         |
| Deno.readLinkSync      | ✅     | `amber`         |                       |
| Deno.readLink          | ❌     | —               | Async variant         |
| Deno.readDirSync       | ✅     | `amber`         |                       |
| Deno.readDir           | ❌     | —               | Async variant         |
| Deno.realPathSync      | ✅     | `amber`         |                       |
| Deno.realPath          | ❌     | —               | Async variant         |
| Deno.truncateSync      | ✅     | `amber`         |                       |
| Deno.truncate          | ❌     | —               | Async variant         |
| Deno.chmodSync         | ✅     | `amber`         |                       |
| Deno.chmod             | ❌     | —               | Async variant         |
| Deno.chownSync         | ✅     | `amber`         |                       |
| Deno.chown             | ❌     | —               | Async variant         |
| Deno.utimeSync         | ✅     | `amber`         |                       |
| Deno.utime             | ❌     | —               | Async variant         |
| Deno.makeTempDirSync   | ✅     | `amber`         |                       |
| Deno.makeTempDir       | ❌     | —               | Async variant         |
| Deno.makeTempFileSync  | ✅     | `amber`         |                       |
| Deno.makeTempFile      | ❌     | —               | Async variant         |
| Deno.umask             | ✅     | `amber`         |                       |
| Deno.watchFs           | ✅     | `amber`         |                       |
| Deno.FsFile            | 🚧     | `amber/fs_file` | Missing async methods |

### Deno.FsFile Members

| Member       | Status | Notes         |
| ------------ | ------ | ------------- |
| readable     | ✅     |               |
| writable     | ✅     |               |
| writeSync    | ✅     |               |
| write        | ❌     | Async variant |
| readSync     | ✅     |               |
| read         | ❌     | Async variant |
| seekSync     | ✅     |               |
| seek         | ❌     | Async variant |
| truncateSync | ✅     |               |
| truncate     | ❌     | Async variant |
| statSync     | ✅     |               |
| stat         | ❌     | Async variant |
| syncSync     | ✅     |               |
| sync         | ❌     | Async variant |
| syncDataSync | ✅     |               |
| syncData     | ❌     | Async variant |
| utimeSync    | ✅     |               |
| utime        | ❌     | Async variant |
| isTerminal   | ✅     |               |
| setRaw       | ✅     |               |
| lockSync     | ✅     |               |
| tryLockSync  | ✅     |               |
| lock         | ❌     | Async variant |
| unlockSync   | ✅     |               |
| unlock       | ❌     | Async variant |
| close        | ✅     |               |

## Network

| API                    | Status | Module                | Notes |
| ---------------------- | ------ | --------------------- | ----- |
| Deno.listen            | ✅     | `amber`               |       |
| Deno.connect           | ✅     | `amber`               |       |
| Deno.listenTls         | ✅     | `amber`               |       |
| Deno.connectTls        | ✅     | `amber`               |       |
| Deno.startTls          | ✅     | `amber`               |       |
| Deno.Conn              | ✅     | `amber/conn`          |       |
| Deno.TcpConn           | ✅     | `amber/conn/tcp_conn` |       |
| Deno.TlsConn           | ✅     | `amber/conn/tls_conn` |       |
| Deno.Listener          | ✅     | `amber/listener`      |       |
| Deno.TlsListener       | ✅     | `amber/tls_listener`  |       |
| Deno.networkInterfaces | ✅     | `amber`               |       |

## HTTP Server

| API                   | Status | Module        | Notes                        |
| --------------------- | ------ | ------------- | ---------------------------- |
| Deno.serve            | ✅     | `amber/serve` | Including HTTPS via Cert/Key |
| Deno.HttpServer       | ✅     | `amber/serve` | Including shutdown()         |
| Deno.upgradeWebSocket | ✅     | `amber`       |                              |

## Subprocess

| API               | Status | Module                | Notes |
| ----------------- | ------ | --------------------- | ----- |
| Deno.Command      | ✅     | `amber/command`       |       |
| Deno.ChildProcess | ✅     | `amber/child_process` |       |
| Deno.kill         | ✅     | `amber`               |       |

## I/O

| API              | Status | Module         | Notes |
| ---------------- | ------ | -------------- | ----- |
| Deno.stdin       | ✅     | `amber/stdin`  |       |
| Deno.stdout      | ✅     | `amber/stdout` |       |
| Deno.stderr      | ✅     | `amber/stderr` |       |
| Deno.inspect     | ✅     | `amber`        |       |
| Deno.consoleSize | ✅     | `amber`        |       |

## Environment

| API             | Status | Module      | Notes |
| --------------- | ------ | ----------- | ----- |
| Deno.env        | ✅     | `amber/env` |       |
| Deno.cwd        | ✅     | `amber`     |       |
| Deno.chdir      | ✅     | `amber`     |       |
| Deno.execPath   | ✅     | `amber`     |       |
| Deno.mainModule | ✅     | `amber`     |       |

## System Info

| API                   | Status | Module  | Notes |
| --------------------- | ------ | ------- | ----- |
| Deno.build            | ✅     | `amber` |       |
| Deno.version          | ✅     | `amber` |       |
| Deno.hostname         | ✅     | `amber` |       |
| Deno.osRelease        | ✅     | `amber` |       |
| Deno.osUptime         | ✅     | `amber` |       |
| Deno.loadavg          | ✅     | `amber` |       |
| Deno.systemMemoryInfo | ✅     | `amber` |       |
| Deno.memoryUsage      | ✅     | `amber` |       |
| Deno.gid              | ✅     | `amber` |       |
| Deno.uid              | ✅     | `amber` |       |
| Deno.pid              | ✅     | `amber` |       |
| Deno.ppid             | ✅     | `amber` |       |
| Deno.noColor          | ✅     | `amber` |       |

## Process

| API                       | Status | Module  | Notes |
| ------------------------- | ------ | ------- | ----- |
| Deno.exit                 | ✅     | `amber` |       |
| Deno.exitCode             | ✅     | `amber` |       |
| Deno.args                 | ✅     | `amber` |       |
| Deno.addSignalListener    | ✅     | `amber` |       |
| Deno.removeSignalListener | ✅     | `amber` |       |
| Deno.refTimer             | ✅     | `amber` |       |
| Deno.unrefTimer           | ✅     | `amber` |       |

## DNS

| API             | Status | Module  | Notes                                                                     |
| --------------- | ------ | ------- | ------------------------------------------------------------------------- |
| Deno.resolveDns | ✅     | `amber` | All record types (A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SRV, TXT) |

## Errors

| API         | Status | Module        | Notes                           |
| ----------- | ------ | ------------- | ------------------------------- |
| Deno.errors | ✅     | `amber/error` | All stable error classes mapped |

## Globals (Deno-specific)

| API     | Status | Module              | Notes |
| ------- | ------ | ------------------- | ----- |
| alert   | ✅     | `amber/global_this` |       |
| confirm | ✅     | `amber/global_this` |       |
| prompt  | ✅     | `amber/global_this` |       |
| close   | ✅     | `amber/global_this` |       |

## Planned

| API              | Priority | Notes                                                               |
| ---------------- | -------- | ------------------------------------------------------------------- |
| Deno.permissions | Medium   | query, request, revoke                                              |
| Deno.openKv      | Medium   | Deno KV storage                                                     |
| Async file ops   | Low      | Async variants of all sync file system functions and FsFile methods |

## Not Yet Planned

These are not currently targeted but could be picked up in the future.

- Deno.test
- Deno.bench
- Deno.dlopen
- Deno.cron
- Deno.jupyter
- Unstable APIs
- Deprecated APIs
