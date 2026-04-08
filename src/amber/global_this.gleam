/// Shows a message and waits for the user to press Enter.
///
/// Does nothing if stdin is not interactive.
///
@external(javascript, "./global_this.ffi.mjs", "alert")
pub fn alert() -> Nil

/// Shows the given message and waits for the user to press Enter.
///
/// Does nothing if stdin is not interactive.
///
@external(javascript, "./global_this.ffi.mjs", "alert_with")
pub fn alert_with(message: String) -> Nil

/// Shows "Confirm" and waits for the user to respond with y/n.
///
/// Returns `False` if stdin is not interactive.
///
@external(javascript, "./global_this.ffi.mjs", "confirm")
pub fn confirm() -> Bool

/// Shows the given message and waits for the user to respond with y/n.
///
/// Returns `False` if stdin is not interactive.
///
@external(javascript, "./global_this.ffi.mjs", "confirm_with")
pub fn confirm_with(message: String) -> Bool

/// Shows "Prompt" and waits for the user to input text.
///
/// Returns `Error(Nil)` if the user cancels or stdin is not interactive.
///
@external(javascript, "./global_this.ffi.mjs", "prompt")
pub fn prompt() -> Result(String, Nil)

/// Shows the given message and waits for the user to input text.
///
/// Returns `Error(Nil)` if the user cancels or stdin is not interactive.
///
@external(javascript, "./global_this.ffi.mjs", "prompt_with")
pub fn prompt_with(message: String) -> Result(String, Nil)

/// Shows the given message and waits for the user to input text, using
/// the provided default value if the user submits empty input.
///
/// Returns `Error(Nil)` if the user cancels or stdin is not interactive.
///
@external(javascript, "./global_this.ffi.mjs", "prompt_with_default")
pub fn prompt_with_default(
  message: String,
  default: String,
) -> Result(String, Nil)

/// Terminates the Deno process.
///
@external(javascript, "./global_this.ffi.mjs", "close")
pub fn close() -> Nil
