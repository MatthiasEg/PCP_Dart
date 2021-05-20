// Every class implicitly defines an interface containing all the instance members of the class and of any interfaces it implements.
abstract class GeneralInterface {
  void doIt() {
    print("Do it the GENERAL way.");
  }
}

abstract class SpecificInterface extends GeneralInterface {
  // @override
  void doIt() {
    print("Do it the SPECIFIC way.");
  }
}

class ClassA implements GeneralInterface, SpecificInterface {
  @override
  void doIt() {
    print("Do it the ClassA way.");
  }
}

// only extends allows the default implementation call
class ClassB extends GeneralInterface implements SpecificInterface {}

class ClassC extends SpecificInterface implements GeneralInterface {}

void main() {
  var a = ClassA();
  a.doIt();

  var b = ClassB();
  b.doIt();

  var c = ClassC();
  c.doIt();
}
