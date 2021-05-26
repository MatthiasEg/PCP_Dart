class MySuperClass {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    print(anInt);
    print(aString);
    print(aList);
    _done = true;
  }
}

void arithmeticOperatorDemo() {
  print("## ~/ ##");
  // ~/ = arithmetic operation. divides and returns integer.
  print("1 ~/ 2 = ${1 ~/ 2}"); // 0
  print("");
}

void cascadeOperatorsDemo() {
  var myClass = MySuperClass();

  print("## .. ##");
  // .. = cascade operations on object that is NOT null
  myClass
    ..anInt = 1
    ..aString = 'my string'
    ..aList.add(1.0)
    ..allDone();
  print("");

  print("## ?.. ##");
  // ?.. = cascade operations on object that might be null
  MySuperClass? myNullClass = null;
  myNullClass // will not be executed
    ?..anInt = 1
    ..aString = 'my string'
    ..aList.add(1.0)
    ..allDone();
  print("");
}

void typeTestOperatorsDemo() {
  var myClass = MySuperClass();
  print("## is ##");
  // is = check if object is of type
  print("myClass is MySuperClass: ${myClass is MySuperClass}"); // true
  print("## is! ##");
  // is! = check if object is NOT of type
  print("myClass is! MySuperClass: ${myClass is! MySuperClass}"); // false
  print("");
}

void bitwiseOperatorsDemo() {
  int a = 5;
  int b = 7;

  print("## &= ##");
  // &= = bitwise AND plus assign
  // equivalent of a = a & b
  // 101 -> 5 in binary
  // 111 -> 7 in binary
  // 101 -> binary result = 5
  print("a &= b = ${a &= b}");
  print("");

  // reset variables
  a = 5;
  b = 7;

  //
  print("## ^= ##");
  // ^= = bitwise XOR plus assign
  // equivalent of a = a ^ b
  // 101 -> 5 in binary
  // 111 -> 7 in binary
  // 010 -> binary result = 2
  print("a ^= b = ${a ^= b}");
  print("");

  // reset variables
  a = 5;
  b = 7;

  print("## <<= ##");
  // <<= = bitwise left shift plus assign
  // equivalent of a = a << b
  // 101 -> 5 in binary
  // 10 1000 0000 -> shift left 7 = 640
  print("a <<= b = ${a <<= b}");
}

void main() {
  arithmeticOperatorDemo();
  cascadeOperatorsDemo();
  typeTestOperatorsDemo();
  bitwiseOperatorsDemo();
}
