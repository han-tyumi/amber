import amber/build.{type Build}
import amber/caa_record.{type CaaRecord}
import amber/conn/tcp_conn.{type TcpConn}
import amber/conn/tls_conn.{type TlsConn}
import amber/connect_option.{type ConnectOption}
import amber/connect_tls_option.{type ConnectTlsOption}
import amber/console_size.{type ConsoleSize}
import amber/dir_entry.{type DirEntry}
import amber/error.{type Error}
import amber/file_info.{type FileInfo}
import amber/fs_file.{type FsFile}
import amber/fs_watcher.{type FsWatcher}
import amber/inspect_option.{type InspectOption}
import amber/listen_option.{type ListenOption}
import amber/listen_tls_option.{type ListenTlsOption}
import amber/listener.{type Listener}
import amber/make_temp.{type MakeTempOption}
import amber/memory_usage.{type MemoryUsage}
import amber/mkdir.{type MkdirOption}
import amber/mx_record.{type MxRecord}
import amber/naptr_record.{type NaptrRecord}
import amber/network_interface_info.{type NetworkInterfaceInfo}
import amber/open.{type OpenOption}
import amber/record_type.{type RecordType}
import amber/remove.{type RemoveOption}
import amber/resolve_dns_option.{type ResolveDnsOption}
import amber/signal.{type Signal}
import amber/soa_record.{type SoaRecord}
import amber/srv_record.{type SrvRecord}
import amber/start_tls_option.{type StartTlsOption}
import amber/symlink.{type SymlinkOption}
import amber/system_memory_info.{type SystemMemoryInfo}
import amber/tls_certified_key_pem.{type TlsCertifiedKeyPem}
import amber/tls_listener.{type TlsListener}
import amber/upgrade_web_socket_option.{type UpgradeWebSocketOption}
import amber/version.{type Version}
import amber/watch_fs.{type WatchFsOption}
import amber/web_socket_upgrade.{type WebSocketUpgrade}
import amber/write_file.{type WriteFileOption}
import gleam/dynamic.{type Dynamic}
import gleam/option.{type Option}
import gossamer/promise.{type Promise}
import gossamer/request.{type Request}
import gossamer/uint8_array.{type Uint8Array}

// File System

@external(javascript, "./amber.ffi.mjs", "link_sync")
pub fn link_sync(oldpath: String, newpath: String) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "open_sync")
pub fn open_sync(
  path: String,
  options: List(OpenOption),
) -> Result(FsFile, Error)

@external(javascript, "./amber.ffi.mjs", "create_sync")
pub fn create_sync(path: String) -> Result(FsFile, Error)

@external(javascript, "./amber.ffi.mjs", "mkdir_sync")
pub fn mkdir_sync(path: String, options: List(MkdirOption)) -> Nil

@external(javascript, "./amber.ffi.mjs", "make_temp_dir_sync")
pub fn make_temp_dir_sync(options: List(MakeTempOption)) -> String

@external(javascript, "./amber.ffi.mjs", "make_temp_file_sync")
pub fn make_temp_file_sync(options: List(MakeTempOption)) -> String

@external(javascript, "./amber.ffi.mjs", "chmod_sync")
pub fn chmod_sync(path: String, mode: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "chown_sync")
pub fn chown_sync(path: String, uid: Option(Int), gid: Option(Int)) -> Nil

@external(javascript, "./amber.ffi.mjs", "remove_sync")
pub fn remove_sync(path: String, options: List(RemoveOption)) -> Nil

@external(javascript, "./amber.ffi.mjs", "rename_sync")
pub fn rename_sync(oldpath: String, newpath: String) -> Nil

@external(javascript, "./amber.ffi.mjs", "read_text_file_sync")
pub fn read_text_file_sync(path: String) -> String

@external(javascript, "./amber.ffi.mjs", "read_file_sync")
pub fn read_file_sync(path: String) -> Uint8Array

@external(javascript, "./amber.ffi.mjs", "real_path_sync")
pub fn real_path_sync(path: String) -> String

@external(javascript, "./amber.ffi.mjs", "read_dir_sync")
pub fn read_dir_sync(path: String) -> List(DirEntry)

@external(javascript, "./amber.ffi.mjs", "copy_file_sync")
pub fn copy_file_sync(from_path: String, to_path: String) -> Nil

@external(javascript, "./amber.ffi.mjs", "read_link_sync")
pub fn read_link_sync(path: String) -> String

@external(javascript, "./amber.ffi.mjs", "lstat_sync")
pub fn lstat_sync(path: String) -> FileInfo

@external(javascript, "./amber.ffi.mjs", "stat_sync")
pub fn stat_sync(path: String) -> FileInfo

@external(javascript, "./amber.ffi.mjs", "write_file_sync")
pub fn write_file_sync(
  path: String,
  data: Uint8Array,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "./amber.ffi.mjs", "write_text_file_sync")
pub fn write_text_file_sync(
  path: String,
  data: String,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "./amber.ffi.mjs", "truncate_sync")
pub fn truncate_sync(name: String, len: Option(Int)) -> Nil

@external(javascript, "./amber.ffi.mjs", "watch_fs")
pub fn watch_fs(paths: List(String), options: List(WatchFsOption)) -> FsWatcher

@external(javascript, "./amber.ffi.mjs", "symlink_sync")
pub fn symlink_sync(
  oldpath: String,
  newpath: String,
  options: List(SymlinkOption),
) -> Nil

@external(javascript, "./amber.ffi.mjs", "utime_sync")
pub fn utime_sync(path: String, atime: Int, mtime: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "umask")
pub fn umask() -> Int

@external(javascript, "./amber.ffi.mjs", "set_umask")
pub fn set_umask(mask: Int) -> Int

// I/O

/// Gets the size of the console as columns/rows.
///
/// This returns the size of the console window as reported by the operating
/// system. It's not a reflection of how many characters will fit within the
/// console window, but can be used as part of that calculation.
///
@external(javascript, "./amber.ffi.mjs", "console_size")
pub fn console_size() -> ConsoleSize

/// Converts the input into a string that has the same format as printed by
/// `console.log()`.
///
@external(javascript, "./amber.ffi.mjs", "inspect")
pub fn inspect(value: Dynamic, options: List(InspectOption)) -> String

// Network

/// Returns an array of the network interface information.
///
@external(javascript, "./amber.ffi.mjs", "network_interfaces")
pub fn network_interfaces() -> List(NetworkInterfaceInfo)

/// Listen announces on the local transport address.
///
@external(javascript, "./amber.ffi.mjs", "listen")
pub fn listen(port: Int, options: List(ListenOption)) -> Listener

/// Connects to the hostname (default is "127.0.0.1") and port on the named
/// transport (default is "tcp"), and resolves to the connection (`TcpConn`).
///
@external(javascript, "./amber.ffi.mjs", "connect")
pub fn connect(port: Int, options: List(ConnectOption)) -> Promise(TcpConn)

/// Establishes a secure connection over TLS (transport layer security)
/// using an optional list of CA certs, hostname (default is "127.0.0.1")
/// and port.
///
/// The CA cert list is optional and if not included Mozilla's root
/// certificates will be used (see also
/// https://github.com/ctz/webpki-roots for specifics).
///
/// Mutual TLS (mTLS or client certificates) are supported by providing a
/// `CertifiedKey` in the options with PEM-encoded key and cert strings.
///
@external(javascript, "./amber.ffi.mjs", "connect_tls")
pub fn connect_tls(
  port: Int,
  options: List(ConnectTlsOption),
) -> Promise(TlsConn)

/// Listen announces on the local transport address over TLS (transport
/// layer security).
///
@external(javascript, "./amber.ffi.mjs", "listen_tls")
pub fn listen_tls(
  port: Int,
  certified_key: TlsCertifiedKeyPem,
  options: List(ListenTlsOption),
) -> TlsListener

/// Start TLS handshake from an existing connection using an optional list
/// of CA certificates, and hostname (default is "127.0.0.1"). Specifying
/// CA certs is optional. By default the configured root certificates are
/// used. Using this function requires that the other end of the connection
/// is prepared for a TLS handshake.
///
/// Note that this function *consumes* the TCP connection passed to it,
/// thus the original TCP connection will be unusable after calling this.
/// Additionally, you need to ensure that the TCP connection is not being
/// used elsewhere when calling this function in order for the TCP
/// connection to be consumed properly. For instance, if there is a
/// `Promise` that is waiting for read operation on the TCP connection to
/// complete, it is considered that the TCP connection is being used
/// elsewhere. In such a case, this function will fail.
///
@external(javascript, "./amber.ffi.mjs", "start_tls")
pub fn start_tls(
  conn: TcpConn,
  options: List(StartTlsOption),
) -> Promise(TlsConn)

// DNS

/// Performs DNS resolution against the given query, returning resolved
/// records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns")
pub fn resolve_dns(
  query: String,
  record_type: RecordType,
  options: List(ResolveDnsOption),
) -> Promise(List(String))

/// Performs DNS resolution for CAA records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_caa")
pub fn resolve_dns_caa(
  query: String,
  options: List(ResolveDnsOption),
) -> Promise(List(CaaRecord))

/// Performs DNS resolution for MX records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_mx")
pub fn resolve_dns_mx(
  query: String,
  options: List(ResolveDnsOption),
) -> Promise(List(MxRecord))

/// Performs DNS resolution for NAPTR records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_naptr")
pub fn resolve_dns_naptr(
  query: String,
  options: List(ResolveDnsOption),
) -> Promise(List(NaptrRecord))

/// Performs DNS resolution for SOA records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_soa")
pub fn resolve_dns_soa(
  query: String,
  options: List(ResolveDnsOption),
) -> Promise(List(SoaRecord))

/// Performs DNS resolution for SRV records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_srv")
pub fn resolve_dns_srv(
  query: String,
  options: List(ResolveDnsOption),
) -> Promise(List(SrvRecord))

/// Performs DNS resolution for TXT records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_txt")
pub fn resolve_dns_txt(
  query: String,
  options: List(ResolveDnsOption),
) -> Promise(List(List(String)))

// WebSockets

/// Upgrade an incoming HTTP request to a WebSocket.
///
/// Given a `Request`, returns a `WebSocketUpgrade` containing a `WebSocket`
/// and `Response`. The original request must be responded to with the
/// returned response for the upgrade to be successful.
///
@external(javascript, "./amber.ffi.mjs", "upgrade_web_socket")
pub fn upgrade_web_socket(request: Request) -> WebSocketUpgrade

/// Upgrade an incoming HTTP request to a WebSocket with options.
///
@external(javascript, "./amber.ffi.mjs", "upgrade_web_socket_with")
pub fn upgrade_web_socket_with(
  request: Request,
  options: List(UpgradeWebSocketOption),
) -> WebSocketUpgrade

// Runtime

@external(javascript, "./amber.ffi.mjs", "add_signal_listener")
pub fn add_signal_listener(signal: Signal, handler: fn() -> any) -> Nil

@external(javascript, "./amber.ffi.mjs", "chdir")
pub fn chdir(directory: String) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "cwd")
pub fn cwd() -> String

@external(javascript, "./amber.ffi.mjs", "exec_path")
pub fn exec_path() -> String

@external(javascript, "./amber.ffi.mjs", "exit")
pub fn exit() -> Nil

@external(javascript, "./amber.ffi.mjs", "exit_with")
pub fn exit_with(code: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "gid")
pub fn gid() -> Option(Int)

@external(javascript, "./amber.ffi.mjs", "hostname")
pub fn hostname() -> String

@external(javascript, "./amber.ffi.mjs", "loadavg")
pub fn loadavg() -> #(Float, Float, Float)

@external(javascript, "./amber.ffi.mjs", "memory_usage")
pub fn memory_usage() -> MemoryUsage

@external(javascript, "./amber.ffi.mjs", "os_release")
pub fn os_release() -> String

@external(javascript, "./amber.ffi.mjs", "os_uptime")
pub fn os_uptime() -> Int

@external(javascript, "./amber.ffi.mjs", "ref_timer")
pub fn ref_timer(id: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "remove_signal_listener")
pub fn remove_signal_listener(signal: Signal, handler: fn() -> any) -> Nil

@external(javascript, "./amber.ffi.mjs", "system_memory_info")
pub fn system_memory_info() -> SystemMemoryInfo

@external(javascript, "./amber.ffi.mjs", "uid")
pub fn uid() -> Option(Int)

@external(javascript, "./amber.ffi.mjs", "unref_timer")
pub fn unref_timer(id: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "args")
pub fn args() -> List(String)

@external(javascript, "./amber.ffi.mjs", "build")
pub fn build() -> Build

@external(javascript, "./amber.ffi.mjs", "exit_code")
pub fn exit_code() -> Int

@external(javascript, "./amber.ffi.mjs", "set_exit_code")
pub fn set_exit_code(code: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "main_module")
pub fn main_module() -> String

@external(javascript, "./amber.ffi.mjs", "no_color")
pub fn no_color() -> Bool

@external(javascript, "./amber.ffi.mjs", "pid")
pub fn pid() -> Int

@external(javascript, "./amber.ffi.mjs", "ppid")
pub fn ppid() -> Int

@external(javascript, "./amber.ffi.mjs", "version")
pub fn version() -> Version

// Subprocess

@external(javascript, "./amber.ffi.mjs", "kill")
pub fn kill(pid: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "kill_with")
pub fn kill_with(pid: Int, signal: Signal) -> Nil
