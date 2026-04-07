import amber/web/response.{type Response}
import amber/web/web_socket.{type WebSocket}

/// The object returned from `deno.upgrade_web_socket`.
///
pub type WebSocketUpgrade {
  WebSocketUpgrade(
    /// The response object that represents the HTTP response to the client,
    /// which should be used to respond to the request for the upgrade to be
    /// successful.
    ///
    response: Response,
    /// The `WebSocket` interface to communicate to the client via a web
    /// socket.
    ///
    socket: WebSocket,
  )
}
