import 'dart:math';

void main() async {
  Stream<int> randomIntStreamGenerator() async* {
    var random = Random();
    while (true) {
      yield random.nextInt(200000);
    }
  }

  var stream = randomIntStreamGenerator();

  // a)
  var value = stream.where((int value) => value > 10000 && value < 12000);
  print(await value.first);

  // b)
  // var filteredStream = stream
  //     .mapIndexed((value, index) => StreamInfo(value, index))
  //     .where((info) => info.value > 10000 && info.value < 12000);
  // var result = await filteredStream.first;
  // print('Found matching ${result.value} at index ${result.index}');
}

class StreamInfo<E> {
  E value;
  int index;

  StreamInfo(this.value, this.index);
}

extension IndexedStream<E> on Stream<E> {
  Stream<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
