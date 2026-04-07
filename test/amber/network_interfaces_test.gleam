import amber
import amber/network_interface_info.{IPv4, IPv6, NetworkInterfaceInfo}
import gleam/list
import gleam/option.{None, Some}
import gleeunit/should

pub fn network_interfaces_test() {
  let interfaces = amber.network_interfaces()
  should.be_true(interfaces != [])

  list.each(interfaces, fn(info) {
    let NetworkInterfaceInfo(
      name: name,
      family: family,
      address: _,
      netmask: _,
      scopeid: scopeid,
      cidr: _,
      mac: _,
    ) = info

    should.be_true(name != "")

    case family {
      IPv6 -> {
        case scopeid {
          Some(_) -> Nil
          None -> panic as "IPv6 should have a scopeid"
        }
      }
      IPv4 -> {
        scopeid |> should.equal(None)
      }
    }
  })
}
