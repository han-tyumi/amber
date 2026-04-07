import amber
import amber/record_type
import gleeunit/should
import gossamer/promise

pub fn resolve_dns_a_test() {
  use records <- promise.then(
    amber.resolve_dns("example.com", record_type.A, []),
  )
  should.be_true(records != [])
  promise.resolve(Nil)
}

pub fn resolve_dns_aaaa_test() {
  use records <- promise.then(
    amber.resolve_dns("example.com", record_type.Aaaa, []),
  )
  should.be_true(records != [])
  promise.resolve(Nil)
}

pub fn resolve_dns_mx_test() {
  use records <- promise.then(amber.resolve_dns_mx("example.com", []))
  should.be_true(records != [])
  promise.resolve(Nil)
}
