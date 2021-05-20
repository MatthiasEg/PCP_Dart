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

void main() {
  // ~/
  print("## ~/ ##");
  print(1 ~/ 2);
  print("");

  // type test is / is!
  var myClass = MySuperClass();
  print("## is ##");
  print(myClass is MySuperClass);
  print("## is! ##");
  print(myClass is! MySuperClass);
  print("");

  // ..
  print("## .. ##");
  myClass
    ..anInt = 1
    ..aString = 'my string'
    ..aList.add(1.0)
    ..allDone();
  print("");

  // ?..
  print("## ?.. ##");
  MySuperClass? myNullClass = null;
  myNullClass
    ?..anInt = 1
    ..aString = 'my string'
    ..aList.add(1.0)
    ..allDone();
  print("");

  // &=
  print("## &= ##");
  int a = 5; // 101
  int b = 7; // 111
  // 101 (5)
  // 111 (7)
  // 101 (5)
  print(a = a & b);
  a = 5;
  b = 7;
  print(a &= b);
  print("");

  // ^=
  print("## ^= ##");
  a = 5;
  b = 7;
  // 101 (5)
  // 111 (7)
  // 010 (2)
  print(a = a ^ b);
  a = 5;
  b = 7;
  print(a ^= b);
  print("");

  // <<=
  print("## <<= ##");
  a = 5;
  b = 7;
  // 101 (5)
  // 101 0000000 (7 shift) -> (640)
  print(a = a << b);
  a = 5;
  b = 7;
  print(a <<= b);
}
