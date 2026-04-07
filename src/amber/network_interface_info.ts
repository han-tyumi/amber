import {
  IpFamily$IPv4,
  IpFamily$IPv6,
  NetworkInterfaceInfo$NetworkInterfaceInfo,
} from "$/amber/amber/network_interface_info.mjs";
import { toOption } from "~/utils/option.ts";

export function toNetworkInterfaceInfoType(
  info: Deno.NetworkInterfaceInfo,
) {
  return NetworkInterfaceInfo$NetworkInterfaceInfo(
    info.name,
    info.family === "IPv4" ? IpFamily$IPv4() : IpFamily$IPv6(),
    info.address,
    info.netmask,
    toOption(info.scopeid),
    info.cidr,
    info.mac,
  );
}
