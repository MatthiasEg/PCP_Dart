
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  // Named constructor
  Point.syntacticSugar(this.x, this.y);

  // Named constructor
  Point.max()
      : x = double.maxFinite,
        y = double.maxFinite;

  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;

  @override
  String toString() {
    return "x: ${x}; y: ${y}";
  }
}

class ThreeDPoint extends Point {

  ThreeDPoint(double x, double y) : super(x, y);
  ThreeDPoint.max(): super.max();

  @override
  String toString() {
    return 'ThreeDPoint ${super.toString()}';
  }
}


void main() {
  var point = Point(5, 6);
  var pointNamed = Point.origin();
  var pointMax = Point.max();

  print(point);
  print(pointNamed);
  print(pointMax);

  var threeDPoint = ThreeDPoint(2, 4);
  print(threeDPoint);

  // named constructors are not inherited - error!
  // var threeDPointOrigin = ThreeDPoint.origin();

  // must be redeclared in subclass explicitly
  var threeDPointMax = ThreeDPoint.max();
  print(threeDPointMax);
}