// TODO

import 'dart:math';

void main() async {
  Stream<int> randomIntStreamGenerator() async* {
    var random = Random();
    while (true) {
      yield random.nextInt(200000);
    }
  }

  var stream = randomIntStreamGenerator();
  var value = stream.where((int value) => value > 10000 && value < 12000);
  print(await value.first);

  // var subscription;
  // var index = 0;

  // subscription = stream.listen((int value) {
  //   if (value > 10000 && value < 12000) {
  //     print('Found matching ${value} at index ${index}');
  //     print('stopping..');
  //     subscription.cancel();
  //   } else {
  //     print('wrong value ${value}');
  //     index += 1;
  //   }
  // });
}
