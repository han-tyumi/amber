import * as $signal from "$/amber/amber/signal.mjs";

export function toSignalType(value: Deno.Signal): $signal.Signal$ {
  switch (value) {
    case "SIGABRT":
      return $signal.Signal$SIGABRT();
    case "SIGALRM":
      return $signal.Signal$SIGALRM();
    case "SIGBREAK":
      return $signal.Signal$SIGBREAK();
    case "SIGBUS":
      return $signal.Signal$SIGBUS();
    case "SIGCHLD":
      return $signal.Signal$SIGCHLD();
    case "SIGCONT":
      return $signal.Signal$SIGCONT();
    case "SIGEMT":
      return $signal.Signal$SIGEMT();
    case "SIGFPE":
      return $signal.Signal$SIGFPE();
    case "SIGHUP":
      return $signal.Signal$SIGHUP();
    case "SIGILL":
      return $signal.Signal$SIGILL();
    case "SIGINFO":
      return $signal.Signal$SIGINFO();
    case "SIGINT":
      return $signal.Signal$SIGINT();
    case "SIGIO":
      return $signal.Signal$SIGIO();
    case "SIGPOLL":
      return $signal.Signal$SIGPOLL();
    case "SIGUNUSED":
      return $signal.Signal$SIGUNUSED();
    case "SIGKILL":
      return $signal.Signal$SIGKILL();
    case "SIGPIPE":
      return $signal.Signal$SIGPIPE();
    case "SIGPROF":
      return $signal.Signal$SIGPROF();
    case "SIGPWR":
      return $signal.Signal$SIGPWR();
    case "SIGQUIT":
      return $signal.Signal$SIGQUIT();
    case "SIGSEGV":
      return $signal.Signal$SIGSEGV();
    case "SIGSTKFLT":
      return $signal.Signal$SIGSTKFLT();
    case "SIGSTOP":
      return $signal.Signal$SIGSTOP();
    case "SIGSYS":
      return $signal.Signal$SIGSYS();
    case "SIGTERM":
      return $signal.Signal$SIGTERM();
    case "SIGTRAP":
      return $signal.Signal$SIGTRAP();
    case "SIGTSTP":
      return $signal.Signal$SIGTSTP();
    case "SIGTTIN":
      return $signal.Signal$SIGTTIN();
    case "SIGTTOU":
      return $signal.Signal$SIGTTOU();
    case "SIGURG":
      return $signal.Signal$SIGURG();
    case "SIGUSR1":
      return $signal.Signal$SIGUSR1();
    case "SIGUSR2":
      return $signal.Signal$SIGUSR2();
    case "SIGVTALRM":
      return $signal.Signal$SIGVTALRM();
    case "SIGWINCH":
      return $signal.Signal$SIGWINCH();
    case "SIGXCPU":
      return $signal.Signal$SIGXCPU();
    case "SIGXFSZ":
      return $signal.Signal$SIGXFSZ();
  }
}

export function toSignal(
  instance: $signal.Signal$,
): Deno.Signal | undefined {
  if ($signal.Signal$isSIGABRT(instance)) return "SIGABRT";
  if ($signal.Signal$isSIGALRM(instance)) return "SIGALRM";
  if ($signal.Signal$isSIGBREAK(instance)) return "SIGBREAK";
  if ($signal.Signal$isSIGBUS(instance)) return "SIGBUS";
  if ($signal.Signal$isSIGCHLD(instance)) return "SIGCHLD";
  if ($signal.Signal$isSIGCONT(instance)) return "SIGCONT";
  if ($signal.Signal$isSIGEMT(instance)) return "SIGEMT";
  if ($signal.Signal$isSIGFPE(instance)) return "SIGFPE";
  if ($signal.Signal$isSIGHUP(instance)) return "SIGHUP";
  if ($signal.Signal$isSIGILL(instance)) return "SIGILL";
  if ($signal.Signal$isSIGINFO(instance)) return "SIGINFO";
  if ($signal.Signal$isSIGINT(instance)) return "SIGINT";
  if ($signal.Signal$isSIGIO(instance)) return "SIGIO";
  if ($signal.Signal$isSIGPOLL(instance)) return "SIGPOLL";
  if ($signal.Signal$isSIGUNUSED(instance)) return "SIGUNUSED";
  if ($signal.Signal$isSIGKILL(instance)) return "SIGKILL";
  if ($signal.Signal$isSIGPIPE(instance)) return "SIGPIPE";
  if ($signal.Signal$isSIGPROF(instance)) return "SIGPROF";
  if ($signal.Signal$isSIGPWR(instance)) return "SIGPWR";
  if ($signal.Signal$isSIGQUIT(instance)) return "SIGQUIT";
  if ($signal.Signal$isSIGSEGV(instance)) return "SIGSEGV";
  if ($signal.Signal$isSIGSTKFLT(instance)) return "SIGSTKFLT";
  if ($signal.Signal$isSIGSTOP(instance)) return "SIGSTOP";
  if ($signal.Signal$isSIGSYS(instance)) return "SIGSYS";
  if ($signal.Signal$isSIGTERM(instance)) return "SIGTERM";
  if ($signal.Signal$isSIGTRAP(instance)) return "SIGTRAP";
  if ($signal.Signal$isSIGTSTP(instance)) return "SIGTSTP";
  if ($signal.Signal$isSIGTTIN(instance)) return "SIGTTIN";
  if ($signal.Signal$isSIGTTOU(instance)) return "SIGTTOU";
  if ($signal.Signal$isSIGURG(instance)) return "SIGURG";
  if ($signal.Signal$isSIGUSR1(instance)) return "SIGUSR1";
  if ($signal.Signal$isSIGUSR2(instance)) return "SIGUSR2";
  if ($signal.Signal$isSIGVTALRM(instance)) return "SIGVTALRM";
  if ($signal.Signal$isSIGWINCH(instance)) return "SIGWINCH";
  if ($signal.Signal$isSIGXCPU(instance)) return "SIGXCPU";
  if ($signal.Signal$isSIGXFSZ(instance)) return "SIGXFSZ";
  return undefined;
}
