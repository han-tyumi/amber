import amber
import amber/conn
import amber/conn/tcp_conn
import amber/listen_option
import amber/listener
import amber/net_addr
import gleam/option.{None, Some}
import gleeunit/should
import gossamer/promise
import gossamer/uint8_array

const listen_port = 4503

pub fn net_tcp_listen_close_test() {
  let assert Ok(tcp_listener) =
    amber.listen_with(listen_port, [listen_option.Hostname("127.0.0.1")])
  let net_addr.NetAddr(transport:, hostname:, port:) =
    listener.addr(tcp_listener)
  should.equal(transport, "tcp")
  should.equal(hostname, "127.0.0.1")
  should.equal(port, listen_port)
  let assert Ok(_) = listener.close(tcp_listener)
}

pub fn net_tcp_dial_listen_test() {
  let assert Ok(tcp_listener) = amber.listen(listen_port)

  promise.then(listener.accept(tcp_listener), fn(result) {
    let assert Ok(accepted) = result
    let accepted_conn = tcp_conn.to_conn(accepted)
    let local = conn.local_addr(accepted_conn)
    should.equal(local.transport, "tcp")
    should.equal(local.hostname, "127.0.0.1")
    should.equal(local.port, listen_port)

    use result <- promise.then(conn.write(
      accepted_conn,
      uint8_array.from_list([1, 2, 3]),
    ))
    let assert Ok(_) = result
    let assert Ok(_) = conn.close(accepted_conn)
    promise.resolve(Nil)
  })

  use result <- promise.then(amber.connect(listen_port))
  let assert Ok(tcp) = result
  let client = tcp_conn.to_conn(tcp)
  let remote = conn.remote_addr(client)
  should.equal(remote.transport, "tcp")
  should.equal(remote.hostname, "127.0.0.1")
  should.equal(remote.port, listen_port)

  let buf = uint8_array.from_length(1024)
  use result <- promise.then(conn.read(client, buf))
  let assert Ok(read_result) = result
  should.equal(read_result, Some(3))
  should.equal(uint8_array.at(buf, 0), Ok(1))
  should.equal(uint8_array.at(buf, 1), Ok(2))
  should.equal(uint8_array.at(buf, 2), Ok(3))

  use result <- promise.then(conn.read(client, buf))
  let assert Ok(read_result2) = result
  should.equal(read_result2, None)

  let assert Ok(_) = listener.close(tcp_listener)
  let assert Ok(_) = conn.close(client)
}
