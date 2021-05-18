// synchronous generator - returns an iterable
Iterable<int> naturalsTo(int n) sync* {
  print('naturalsTo executed');
  int k = 0;
  while (k < n) yield k++;
}

// asynchronous generator - returns a stream
Stream<int> asynchronousNaturalsTo(int n) async* {
  print('asynchronousNaturalsTo executed');
  int k = 0;
  while (k < n) yield k++;
}

// improve performance of recursive generator with yield* keyword
Iterable<int> naturalsDownFrom(int n) sync* {
  print('naturalsDownFrom executed');
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
    // yield* - It delegates the call to another generator and after that generator
    // stops producing the values, it resumes generating its own values.
  }
}

void main() {
  var iterable = naturalsTo(5);
  var stream = asynchronousNaturalsTo(5);

  print('Before iterable');
  for (int number in iterable) {
    print(number);
  }
  print('After iterable');

  print('Before stream');
  stream.listen((int value) {
    print(value);
  });
  print('After stream');

  print('End main');
}
