import amber/deno
import amber/deno/record_type
import amber/web/promise
import gleeunit/should

pub fn resolve_dns_a_test() {
  use records <- promise.then(
    deno.resolve_dns("example.com", record_type.A, []),
  )
  should.be_true(records != [])
  promise.resolve(Nil)
}

pub fn resolve_dns_aaaa_test() {
  use records <- promise.then(
    deno.resolve_dns("example.com", record_type.Aaaa, []),
  )
  should.be_true(records != [])
  promise.resolve(Nil)
}

pub fn resolve_dns_mx_test() {
  use records <- promise.then(deno.resolve_dns_mx("example.com", []))
  should.be_true(records != [])
  promise.resolve(Nil)
}
