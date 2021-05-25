import 'dart:mirrors';

@Todo('anyone', 'Rename class')
class Television {
  @Todo('Matthias', 'Change field type')
  late int value;

  /// _Deprecated: Use [turnOn] instead. Put your text here.._
  @deprecated
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {
    print('turned on!');
  }

  @Todo('Mario', 'Make this do something')
  void turnOff() {
    throw Exception('Not Implemented');
  }
}

class Todo {
  final String who;
  final String what;

  // Constructor must be constant
  const Todo(this.who, this.what);

  @override // seconds default annotation next to @deprecated
  String toString() {
    return '${who} should do: ${what}';
  }
}

void main() {
  // deprecated
  Television().activate();

  // use of mirror to retrieve metadata
  var television = Television();
  var instanceMirror = reflect(television);
  ClassMirror classMirror = instanceMirror.type;

  classMirror.metadata.forEach((metadata) {
    if (metadata.reflectee is Todo) {
      print('${metadata.reflectee.who} should do: ${metadata.reflectee.what}');
    }
  });

  for (var v in classMirror.declarations.values) {
    if (!v.metadata.isEmpty) {
      if (v.metadata.first.reflectee is Todo) {
        print(
            '${v.metadata.first.reflectee.who} should do: ${v.metadata.first.reflectee.what}');
      }
    }
  }
}
