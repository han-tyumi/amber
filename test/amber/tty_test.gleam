import amber/deno
import amber/deno/console_size.{ConsoleSize}
import amber/deno/stdout

pub fn console_size_test() {
  case stdout.is_terminal() {
    True -> {
      let ConsoleSize(_, _) = deno.console_size()
      Nil
    }
    False -> Nil
  }
}
