import amber
import amber/console_size.{ConsoleSize}
import amber/stdout

pub fn console_size_test() {
  case stdout.is_terminal() {
    True -> {
      let ConsoleSize(_, _) = amber.console_size()
      Nil
    }
    False -> Nil
  }
}
