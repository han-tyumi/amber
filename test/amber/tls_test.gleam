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
  let assert Ok(key_text) = amber.read_text_file_sync(key)
  let assert Ok(cert_text) = amber.read_text_file_sync(cert)
  TlsCertifiedKeyPem(key: key_text, cert: cert_text)
}

fn ca_certs() {
  let assert Ok(ca_cert_text) = amber.read_text_file_sync(ca_cert)
  [ca_cert_text]
}

pub fn tls_listen_close_test() {
  let assert Ok(listener) = amber.listen_tls(0, certified_key())
  let addr = tls_listener.addr(listener)
  should.equal(addr.transport, "tcp")
  let assert Ok(_) = tls_listener.close(listener)
}

pub fn tls_connect_test() {
  let assert Ok(listener) =
    amber.listen_tls_with(0, certified_key(), [
      listen_tls_option.Hostname("localhost"),
    ])
  let port = tls_listener.addr(listener).port

  promise.then(tls_listener.accept(listener), fn(result) {
    let assert Ok(accepted) = result
    let server = tls_conn.to_conn(accepted)
    use result <- promise.then(conn.write(
      server,
      uint8_array.from_list([1, 2, 3]),
    ))
    let assert Ok(_) = result
    let assert Ok(_) = conn.close(server)
    promise.resolve(Nil)
  })

  use result <- promise.then(
    amber.connect_tls_with(port, [
      connect_tls_option.Hostname("localhost"),
      connect_tls_option.CaCerts(ca_certs()),
    ]),
  )
  let assert Ok(client) = result
  let client_conn = tls_conn.to_conn(client)

  let buf = uint8_array.from_length(1024)
  use result <- promise.then(conn.read(client_conn, buf))
  let assert Ok(read_result) = result
  should.equal(read_result, Some(3))
  should.equal(uint8_array.at(buf, 0), Ok(1))
  should.equal(uint8_array.at(buf, 1), Ok(2))
  should.equal(uint8_array.at(buf, 2), Ok(3))

  use result <- promise.then(conn.read(client_conn, buf))
  let assert Ok(read_result2) = result
  should.equal(read_result2, None)

  let assert Ok(_) = tls_listener.close(listener)
  let assert Ok(_) = conn.close(client_conn)
}

pub fn tls_handshake_test() {
  let assert Ok(listener) =
    amber.listen_tls_with(0, certified_key(), [
      listen_tls_option.Hostname("localhost"),
      listen_tls_option.AlpnProtocols(["h2", "http/1.1"]),
    ])
  let port = tls_listener.addr(listener).port

  promise.then(tls_listener.accept(listener), fn(result) {
    let assert Ok(accepted) = result
    use result <- promise.then(tls_conn.handshake(accepted))
    let assert Ok(info) = result
    should.equal(info.alpn_protocol, Some("h2"))
    let assert Ok(_) = conn.close(tls_conn.to_conn(accepted))
    promise.resolve(Nil)
  })

  use result <- promise.then(
    amber.connect_tls_with(port, [
      connect_tls_option.Hostname("localhost"),
      connect_tls_option.CaCerts(ca_certs()),
      connect_tls_option.AlpnProtocols(["h2", "http/1.1"]),
    ]),
  )
  let assert Ok(client) = result

  use result <- promise.then(tls_conn.handshake(client))
  let assert Ok(info) = result
  should.equal(info.alpn_protocol, Some("h2"))

  let assert Ok(_) = conn.close(tls_conn.to_conn(client))
  let assert Ok(_) = tls_listener.close(listener)
}
