import amber
import amber/conn
import amber/conn/tls_conn
import amber/connect_tls_option
import amber/listen_tls_option
import amber/tls_certified_key_pem.{TlsCertifiedKeyPem}
import amber/tls_listener
import gleam/option.{None, Some}
import gleeunit/should
import gossamer/promise
import gossamer/uint8_array

const cert = "test/fixtures/tls/localhost.crt"

const key = "test/fixtures/tls/localhost.key"

const ca_cert = "test/fixtures/tls/ca.crt"

fn certified_key() {
  TlsCertifiedKeyPem(
    key: amber.read_text_file_sync(key),
    cert: amber.read_text_file_sync(cert),
  )
}

fn ca_certs() {
  [amber.read_text_file_sync(ca_cert)]
}

pub fn tls_listen_close_test() {
  let listener = amber.listen_tls(0, certified_key(), [])
  let addr = tls_listener.addr(listener)
  should.equal(addr.transport, "tcp")
  tls_listener.close(listener)
}

pub fn tls_connect_test() {
  let listener =
    amber.listen_tls(0, certified_key(), [
      listen_tls_option.Hostname("localhost"),
    ])
  let port = tls_listener.addr(listener).port

  promise.then(tls_listener.accept(listener), fn(accepted) {
    let server = tls_conn.to_conn(accepted)
    use _ <- promise.then(conn.write(server, uint8_array.from_list([1, 2, 3])))
    conn.close(server)
    promise.resolve(Nil)
  })

  use client <- promise.then(
    amber.connect_tls(port, [
      connect_tls_option.Hostname("localhost"),
      connect_tls_option.CaCerts(ca_certs()),
    ]),
  )
  let client_conn = tls_conn.to_conn(client)

  let buf = uint8_array.from_length(1024)
  use read_result <- promise.then(conn.read(client_conn, buf))
  should.equal(read_result, Some(3))
  should.equal(uint8_array.at(buf, 0), Some(1))
  should.equal(uint8_array.at(buf, 1), Some(2))
  should.equal(uint8_array.at(buf, 2), Some(3))

  use read_result2 <- promise.then(conn.read(client_conn, buf))
  should.equal(read_result2, None)

  tls_listener.close(listener)
  conn.close(client_conn)
}

pub fn tls_handshake_test() {
  let listener =
    amber.listen_tls(0, certified_key(), [
      listen_tls_option.Hostname("localhost"),
      listen_tls_option.AlpnProtocols(["h2", "http/1.1"]),
    ])
  let port = tls_listener.addr(listener).port

  promise.then(tls_listener.accept(listener), fn(accepted) {
    use info <- promise.then(tls_conn.handshake(accepted))
    should.equal(info.alpn_protocol, Some("h2"))
    conn.close(tls_conn.to_conn(accepted))
    promise.resolve(Nil)
  })

  use client <- promise.then(
    amber.connect_tls(port, [
      connect_tls_option.Hostname("localhost"),
      connect_tls_option.CaCerts(ca_certs()),
      connect_tls_option.AlpnProtocols(["h2", "http/1.1"]),
    ]),
  )

  use info <- promise.then(tls_conn.handshake(client))
  should.equal(info.alpn_protocol, Some("h2"))

  conn.close(tls_conn.to_conn(client))
  tls_listener.close(listener)
}
