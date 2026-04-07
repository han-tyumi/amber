import * as $option from "$/amber/amber/deno/resolve_dns_option.mjs";
import { toArray } from "~/utils/list.ts";

export function toResolveDnsOptions(
  options: $option.ResolveDnsOption$[],
): Deno.ResolveDnsOptions {
  const result: Deno.ResolveDnsOptions = {};

  for (const option of options) {
    if ($option.ResolveDnsOption$isNameServer(option)) {
      result.nameServer = {
        ipAddr: $option.ResolveDnsOption$NameServer$ip_addr(option),
      };
    } else if ($option.ResolveDnsOption$isNameServerWithPort(option)) {
      result.nameServer = {
        ipAddr: $option.ResolveDnsOption$NameServerWithPort$ip_addr(option),
        port: $option.ResolveDnsOption$NameServerWithPort$port(option),
      };
    } else if ($option.ResolveDnsOption$isSignal(option)) {
      result.signal = $option.ResolveDnsOption$Signal$0(option);
    }
  }

  return result;
}

export function toResolveDnsOptionsArray(
  options: Parameters<typeof toArray>[0],
): Deno.ResolveDnsOptions {
  return toResolveDnsOptions(toArray(options) as $option.ResolveDnsOption$[]);
}
