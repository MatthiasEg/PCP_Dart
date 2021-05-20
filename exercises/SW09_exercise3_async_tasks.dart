import 'dart:io';
import 'dart:async';
import 'dart:isolate';

Future<void> longLastingTask(SendPort sendPort) async {
  await Future.delayed(Duration(seconds: 3));
  stdout.write("3000");
  sendPort.send(3000);
}

Future<void> evenLongerLastingTask(SendPort sendPort) async {
  await Future.delayed(Duration(seconds: 6));
  stdout.write("6000");
  sendPort.send(6000);
}

Completer spawnIsolate(Function(SendPort) funcToExecute) {
  var receivePort = ReceivePort();
  var completer = Completer();

  Isolate.spawn(funcToExecute, receivePort.sendPort);

  receivePort.listen((data) {
    completer.complete(data);
  });

  return completer;
}

void main() async {
  print("-> Now waiting for things to happen! ");
  var longLastingTaskFutureCompleter = spawnIsolate(longLastingTask);
  var evenLongerLastingTaskFutureCompleter = spawnIsolate(evenLongerLastingTask);

  Future.wait([
    longLastingTaskFutureCompleter.future,
    evenLongerLastingTaskFutureCompleter.future
  ]).then((results) async {
    await Future.delayed(Duration(seconds: 2));
    stdout.write("was waiting for ${results[0] + results[1] + 2000} ms");
    print("");
    print("-> Done");
    exit(0);
  });

  Timer.periodic(Duration(milliseconds: 500), (timer) {
    stdout.write(".");
  });
}
