import gossamer/abort_signal.{type AbortSignal}

pub type ResolveDnsOption {
  /// The name server to be used for lookups. If not specified, defaults
  /// to the system configuration. For example `/etc/resolv.conf` on
  /// Unix-like systems.
  ///
  NameServer(ip_addr: String)
  /// The name server to be used for lookups, with a specific port.
  ///
  NameServerWithPort(ip_addr: String, port: Int)
  /// An abort signal to allow cancellation of the DNS resolution
  /// operation. If the signal becomes aborted the `resolve_dns`
  /// operation will be stopped and the promise returned will be rejected
  /// with an AbortError.
  ///
  Signal(AbortSignal)
}
