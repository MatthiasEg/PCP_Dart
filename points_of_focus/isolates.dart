import 'dart:io';
import 'dart:async';
import 'dart:isolate';

Future<Isolate> start() async {
  print("spawning isolate...");

  var receivePort = ReceivePort();
  var isolate = await Isolate.spawn(runIsolateTask, receivePort.sendPort);
  receivePort.listen((data) {
    print(data);
  });

  return isolate;
}

void runIsolateTask(SendPort sendPort) {
  print("running task in background...");
  var counter = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    sendPort.send("counter: $counter");
    counter++;
  });
}

void stopIsolateExecution(Isolate isolate) {
  print("stoppoing isolate execution...");
  isolate.kill(priority: Isolate.immediate);
}

void main() async {
  
  var isolate = await start();

  print("press any key to kill isolate");
  await stdin.first;

  stopIsolateExecution(isolate);
  exit(0);
}
