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
import gleam/option.{type Option}
import gossamer/promise.{type Promise}
import gossamer/request.{type Request}
import gossamer/uint8_array.{type Uint8Array}

// File System

/// Creates a hard link from `oldpath` to `newpath`.
///
@external(javascript, "./amber.ffi.mjs", "link_sync")
pub fn link_sync(from oldpath: String, to newpath: String) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "open_sync")
pub fn open_sync(path: String) -> Result(FsFile, Error)

@external(javascript, "./amber.ffi.mjs", "open_sync_with")
pub fn open_sync_with(
  path: String,
  with options: List(OpenOption),
) -> Result(FsFile, Error)

@external(javascript, "./amber.ffi.mjs", "create_sync")
pub fn create_sync(path: String) -> Result(FsFile, Error)

@external(javascript, "./amber.ffi.mjs", "mkdir_sync")
pub fn mkdir_sync(path: String) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "mkdir_sync_with")
pub fn mkdir_sync_with(
  path: String,
  with options: List(MkdirOption),
) -> Result(Nil, Error)

/// Creates a new temporary directory in the default system temp directory and
/// returns its path.
///
@external(javascript, "./amber.ffi.mjs", "make_temp_dir_sync")
pub fn make_temp_dir_sync() -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "make_temp_dir_sync_with")
pub fn make_temp_dir_sync_with(
  with options: List(MakeTempOption),
) -> Result(String, Error)

/// Creates a new temporary file in the default system temp directory and
/// returns its path.
///
@external(javascript, "./amber.ffi.mjs", "make_temp_file_sync")
pub fn make_temp_file_sync() -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "make_temp_file_sync_with")
pub fn make_temp_file_sync_with(
  with options: List(MakeTempOption),
) -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "chmod_sync")
pub fn chmod_sync(path: String, mode mode: Int) -> Result(Nil, Error)

/// Changes the owner of the file specified by path. Either `uid` or `gid` can
/// be set to `None` to leave that value unchanged.
///
@external(javascript, "./amber.ffi.mjs", "chown_sync")
pub fn chown_sync(
  path: String,
  uid uid: Option(Int),
  gid gid: Option(Int),
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "remove_sync")
pub fn remove_sync(path: String) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "remove_sync_with")
pub fn remove_sync_with(
  path: String,
  with options: List(RemoveOption),
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "rename_sync")
pub fn rename_sync(
  from oldpath: String,
  to newpath: String,
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "read_text_file_sync")
pub fn read_text_file_sync(path: String) -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "read_file_sync")
pub fn read_file_sync(path: String) -> Result(Uint8Array, Error)

/// Resolves the given path to an absolute path, resolving all symlinks along
/// the way.
///
@external(javascript, "./amber.ffi.mjs", "real_path_sync")
pub fn real_path_sync(path: String) -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "read_dir_sync")
pub fn read_dir_sync(path: String) -> Result(List(DirEntry), Error)

@external(javascript, "./amber.ffi.mjs", "copy_file_sync")
pub fn copy_file_sync(
  from from_path: String,
  to to_path: String,
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "read_link_sync")
pub fn read_link_sync(path: String) -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "lstat_sync")
pub fn lstat_sync(path: String) -> Result(FileInfo, Error)

@external(javascript, "./amber.ffi.mjs", "stat_sync")
pub fn stat_sync(path: String) -> Result(FileInfo, Error)

/// Writes the given data to the file at the specified path. Creates the file
/// if it doesn't exist, and truncates it if it does.
///
@external(javascript, "./amber.ffi.mjs", "write_file_sync")
pub fn write_file_sync(
  to path: String,
  contents data: Uint8Array,
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "write_file_sync_with")
pub fn write_file_sync_with(
  to path: String,
  contents data: Uint8Array,
  with options: List(WriteFileOption),
) -> Result(Nil, Error)

/// Writes the given string data to the file at the specified path. Creates the
/// file if it doesn't exist, and truncates it if it does.
///
@external(javascript, "./amber.ffi.mjs", "write_text_file_sync")
pub fn write_text_file_sync(
  to path: String,
  contents data: String,
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "write_text_file_sync_with")
pub fn write_text_file_sync_with(
  to path: String,
  contents data: String,
  with options: List(WriteFileOption),
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "truncate_sync")
pub fn truncate_sync(name: String) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "truncate_to_length_sync")
pub fn truncate_to_length_sync(name: String, to len: Int) -> Result(Nil, Error)

/// Returns a watcher that yields file system events for the given paths.
///
@external(javascript, "./amber.ffi.mjs", "watch_fs")
pub fn watch_fs(paths: List(String)) -> FsWatcher

@external(javascript, "./amber.ffi.mjs", "watch_fs_with")
pub fn watch_fs_with(
  paths: List(String),
  with options: List(WatchFsOption),
) -> FsWatcher

/// Creates a symbolic link from `oldpath` to `newpath`.
///
@external(javascript, "./amber.ffi.mjs", "symlink_sync")
pub fn symlink_sync(
  from oldpath: String,
  to newpath: String,
) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "symlink_sync_with")
pub fn symlink_sync_with(
  from oldpath: String,
  to newpath: String,
  with options: List(SymlinkOption),
) -> Result(Nil, Error)

/// Changes the access and modification times of the file at the given path.
/// Timestamps are Unix timestamps in seconds.
///
@external(javascript, "./amber.ffi.mjs", "utime_sync")
pub fn utime_sync(
  path: String,
  atime atime: Int,
  mtime mtime: Int,
) -> Result(Nil, Error)

/// Returns the process file mode creation mask.
///
@external(javascript, "./amber.ffi.mjs", "umask")
pub fn umask() -> Result(Int, Error)

/// Sets the process file mode creation mask and returns the previous value.
///
@external(javascript, "./amber.ffi.mjs", "set_umask")
pub fn set_umask(mask: Int) -> Result(Int, Error)

// I/O

/// Gets the size of the console as columns/rows.
///
/// This returns the size of the console window as reported by the operating
/// system. It's not a reflection of how many characters will fit within the
/// console window, but can be used as part of that calculation.
///
@external(javascript, "./amber.ffi.mjs", "console_size")
pub fn console_size() -> Result(ConsoleSize, Error)

/// Converts the input into a string that has the same format as printed by
/// `console.log()`.
///
@external(javascript, "./amber.ffi.mjs", "inspect")
pub fn inspect(value: a) -> String

@external(javascript, "./amber.ffi.mjs", "inspect_with")
pub fn inspect_with(value: a, with options: List(InspectOption)) -> String

// Network

/// Returns an array of the network interface information.
///
@external(javascript, "./amber.ffi.mjs", "network_interfaces")
pub fn network_interfaces() -> Result(List(NetworkInterfaceInfo), Error)

/// Listen announces on the local transport address.
///
@external(javascript, "./amber.ffi.mjs", "listen")
pub fn listen(port: Int) -> Result(Listener, Error)

/// Listen announces on the local transport address with options.
///
@external(javascript, "./amber.ffi.mjs", "listen_with")
pub fn listen_with(
  port: Int,
  with options: List(ListenOption),
) -> Result(Listener, Error)

/// Connects to the hostname (default is "127.0.0.1") and port on the named
/// transport (default is "tcp"), and resolves to the connection (`TcpConn`).
///
@external(javascript, "./amber.ffi.mjs", "connect")
pub fn connect(port: Int) -> Promise(Result(TcpConn, Error))

/// Connects to the given hostname and port with options.
///
@external(javascript, "./amber.ffi.mjs", "connect_with")
pub fn connect_with(
  port: Int,
  with options: List(ConnectOption),
) -> Promise(Result(TcpConn, Error))

/// Establishes a secure connection over TLS (transport layer security).
///
/// Uses Mozilla's root certificates by default (see also
/// https://github.com/ctz/webpki-roots for specifics).
///
@external(javascript, "./amber.ffi.mjs", "connect_tls")
pub fn connect_tls(port: Int) -> Promise(Result(TlsConn, Error))

/// Establishes a secure connection over TLS with options.
///
/// Custom CA certs, hostname, and mutual TLS (mTLS or client certificates)
/// are supported through the options.
///
@external(javascript, "./amber.ffi.mjs", "connect_tls_with")
pub fn connect_tls_with(
  port: Int,
  with options: List(ConnectTlsOption),
) -> Promise(Result(TlsConn, Error))

/// Listen announces on the local transport address over TLS (transport
/// layer security).
///
@external(javascript, "./amber.ffi.mjs", "listen_tls")
pub fn listen_tls(
  port: Int,
  certified_key certified_key: TlsCertifiedKeyPem,
) -> Result(TlsListener, Error)

/// Listen announces on the local transport address over TLS with options.
///
@external(javascript, "./amber.ffi.mjs", "listen_tls_with")
pub fn listen_tls_with(
  port: Int,
  certified_key certified_key: TlsCertifiedKeyPem,
  with options: List(ListenTlsOption),
) -> Result(TlsListener, Error)

/// Start TLS handshake from an existing connection using the configured
/// root certificates. Using this function requires that the other end of
/// the connection is prepared for a TLS handshake.
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
pub fn start_tls(conn: TcpConn) -> Promise(Result(TlsConn, Error))

/// Start TLS handshake from an existing connection with options.
///
@external(javascript, "./amber.ffi.mjs", "start_tls_with")
pub fn start_tls_with(
  conn: TcpConn,
  with options: List(StartTlsOption),
) -> Promise(Result(TlsConn, Error))

// DNS

/// Performs DNS resolution against the given query, returning resolved records
/// as strings. For structured record types (MX, SRV, etc.), use the
/// type-specific variants like `resolve_dns_mx`.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns")
pub fn resolve_dns(
  query: String,
  record_type record_type: RecordType,
) -> Promise(Result(List(String), Error))

@external(javascript, "./amber.ffi.mjs", "resolve_dns_with")
pub fn resolve_dns_with(
  query: String,
  record_type record_type: RecordType,
  with options: List(ResolveDnsOption),
) -> Promise(Result(List(String), Error))

/// Performs DNS resolution for CAA records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_caa")
pub fn resolve_dns_caa(query: String) -> Promise(Result(List(CaaRecord), Error))

@external(javascript, "./amber.ffi.mjs", "resolve_dns_caa_with")
pub fn resolve_dns_caa_with(
  query: String,
  with options: List(ResolveDnsOption),
) -> Promise(Result(List(CaaRecord), Error))

/// Performs DNS resolution for MX records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_mx")
pub fn resolve_dns_mx(query: String) -> Promise(Result(List(MxRecord), Error))

@external(javascript, "./amber.ffi.mjs", "resolve_dns_mx_with")
pub fn resolve_dns_mx_with(
  query: String,
  with options: List(ResolveDnsOption),
) -> Promise(Result(List(MxRecord), Error))

/// Performs DNS resolution for NAPTR records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_naptr")
pub fn resolve_dns_naptr(
  query: String,
) -> Promise(Result(List(NaptrRecord), Error))

@external(javascript, "./amber.ffi.mjs", "resolve_dns_naptr_with")
pub fn resolve_dns_naptr_with(
  query: String,
  with options: List(ResolveDnsOption),
) -> Promise(Result(List(NaptrRecord), Error))

/// Performs DNS resolution for SOA records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_soa")
pub fn resolve_dns_soa(query: String) -> Promise(Result(List(SoaRecord), Error))

@external(javascript, "./amber.ffi.mjs", "resolve_dns_soa_with")
pub fn resolve_dns_soa_with(
  query: String,
  with options: List(ResolveDnsOption),
) -> Promise(Result(List(SoaRecord), Error))

/// Performs DNS resolution for SRV records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_srv")
pub fn resolve_dns_srv(query: String) -> Promise(Result(List(SrvRecord), Error))

@external(javascript, "./amber.ffi.mjs", "resolve_dns_srv_with")
pub fn resolve_dns_srv_with(
  query: String,
  with options: List(ResolveDnsOption),
) -> Promise(Result(List(SrvRecord), Error))

/// Performs DNS resolution for TXT records.
///
@external(javascript, "./amber.ffi.mjs", "resolve_dns_txt")
pub fn resolve_dns_txt(
  query: String,
) -> Promise(Result(List(List(String)), Error))

@external(javascript, "./amber.ffi.mjs", "resolve_dns_txt_with")
pub fn resolve_dns_txt_with(
  query: String,
  with options: List(ResolveDnsOption),
) -> Promise(Result(List(List(String)), Error))

// WebSockets

/// Upgrade an incoming HTTP request to a WebSocket.
///
/// Given a `Request`, returns a `WebSocketUpgrade` containing a `WebSocket`
/// and `Response`. The original request must be responded to with the
/// returned response for the upgrade to be successful.
///
@external(javascript, "./amber.ffi.mjs", "upgrade_web_socket")
pub fn upgrade_web_socket(request: Request) -> Result(WebSocketUpgrade, Error)

/// Upgrade an incoming HTTP request to a WebSocket with options.
///
@external(javascript, "./amber.ffi.mjs", "upgrade_web_socket_with")
pub fn upgrade_web_socket_with(
  request: Request,
  with options: List(UpgradeWebSocketOption),
) -> Result(WebSocketUpgrade, Error)

// Runtime

/// Registers a handler function to be called when the given OS signal is
/// received.
///
@external(javascript, "./amber.ffi.mjs", "add_signal_listener")
pub fn add_signal_listener(signal: Signal, run handler: fn() -> any) -> Nil

/// Changes the current working directory of the process.
///
@external(javascript, "./amber.ffi.mjs", "chdir")
pub fn chdir(directory: String) -> Result(Nil, Error)

@external(javascript, "./amber.ffi.mjs", "cwd")
pub fn cwd() -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "exec_path")
pub fn exec_path() -> Result(String, Error)

/// Terminates the current process with exit code 0. This function never
/// returns.
///
@external(javascript, "./amber.ffi.mjs", "exit")
pub fn exit() -> Nil

/// Terminates the current process with the given exit code. This function
/// never returns.
///
@external(javascript, "./amber.ffi.mjs", "exit_with")
pub fn exit_with(code: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "gid")
pub fn gid() -> Result(Option(Int), Error)

@external(javascript, "./amber.ffi.mjs", "hostname")
pub fn hostname() -> Result(String, Error)

/// Returns the system load averages for the past 1, 5, and 15 minutes.
///
@external(javascript, "./amber.ffi.mjs", "loadavg")
pub fn loadavg() -> Result(#(Float, Float, Float), Error)

@external(javascript, "./amber.ffi.mjs", "memory_usage")
pub fn memory_usage() -> MemoryUsage

@external(javascript, "./amber.ffi.mjs", "os_release")
pub fn os_release() -> Result(String, Error)

@external(javascript, "./amber.ffi.mjs", "os_uptime")
pub fn os_uptime() -> Result(Int, Error)

/// Makes the timer with the given ID block the event loop from finishing.
///
@external(javascript, "./amber.ffi.mjs", "ref_timer")
pub fn ref_timer(id: Int) -> Nil

/// Removes a previously registered OS signal handler.
///
@external(javascript, "./amber.ffi.mjs", "remove_signal_listener")
pub fn remove_signal_listener(signal: Signal, run handler: fn() -> any) -> Nil

@external(javascript, "./amber.ffi.mjs", "system_memory_info")
pub fn system_memory_info() -> Result(SystemMemoryInfo, Error)

@external(javascript, "./amber.ffi.mjs", "uid")
pub fn uid() -> Result(Option(Int), Error)

/// Makes the timer with the given ID not block the event loop from finishing.
///
@external(javascript, "./amber.ffi.mjs", "unref_timer")
pub fn unref_timer(id: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "args")
pub fn args() -> List(String)

@external(javascript, "./amber.ffi.mjs", "build")
pub fn build() -> Build

@external(javascript, "./amber.ffi.mjs", "exit_code")
pub fn exit_code() -> Int

/// Sets the process exit code used when the process exits naturally, without
/// terminating immediately.
///
@external(javascript, "./amber.ffi.mjs", "set_exit_code")
pub fn set_exit_code(code: Int) -> Nil

@external(javascript, "./amber.ffi.mjs", "main_module")
pub fn main_module() -> String

@external(javascript, "./amber.ffi.mjs", "is_no_color")
pub fn is_no_color() -> Bool

@external(javascript, "./amber.ffi.mjs", "pid")
pub fn pid() -> Int

@external(javascript, "./amber.ffi.mjs", "ppid")
pub fn ppid() -> Int

@external(javascript, "./amber.ffi.mjs", "version")
pub fn version() -> Version

// Subprocess

/// Sends `SIGTERM` to the process with the given PID.
///
@external(javascript, "./amber.ffi.mjs", "kill")
pub fn kill(pid: Int) -> Result(Nil, Error)

/// Sends the given signal to the process with the given PID.
///
@external(javascript, "./amber.ffi.mjs", "kill_with")
pub fn kill_with(pid: Int, with signal: Signal) -> Result(Nil, Error)
