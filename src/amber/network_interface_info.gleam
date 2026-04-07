import gleam/option.{type Option}

pub type IpFamily {
  IPv4
  IPv6
}

/// The information for a network interface returned from a call to
/// [`amber.network_interfaces`](../amber.html#network_interfaces).
///
pub type NetworkInterfaceInfo {
  NetworkInterfaceInfo(
    /// The network interface name.
    name: String,
    /// The IP protocol version.
    family: IpFamily,
    /// The IP address bound to the interface.
    address: String,
    /// The netmask applied to the interface.
    netmask: String,
    /// The IPv6 scope id or `None`.
    scopeid: Option(Int),
    /// The CIDR range.
    cidr: String,
    /// The MAC address.
    mac: String,
  )
}
