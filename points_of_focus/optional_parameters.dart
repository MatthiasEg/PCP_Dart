void positionalParameters(int param) {
  print(param);
}

void namedParameters({int? param1, int? param2}) {
  print(param1);
  print(param2);
}

void namedRequiredParameters({required int? param1, int? param2}) {
  print(param1);
  print(param2);
}

void optionalPositionalParameters([int? param]) {
  print(param);
}

void positionalAndNamedParameters(int requiredParam,
    {int? optionalNamedParam}) {
  print(requiredParam);
  print(optionalNamedParam);
}

void positionalAndOptionalPositionalParameters(int requiredParam,
    [int? optionalPositionalParam]) {
  print(requiredParam);
  print(optionalPositionalParam);
}

// void illegalParameterCombination(int requiredParam, {int? optionalNamedParam}, [int? optionalPositionalParameter]) { }

void main() {
  positionalParameters(1);
  // positionalParameters(); --> compiler error

  namedParameters(); // named parameters are optional by design
  namedParameters(param1: 1, param2: 2);
  // namedParameters(1, 2); --> compiler error

  namedRequiredParameters(param1: 1);
  namedRequiredParameters(param1: 1, param2: 2);
  // namedRequiredParameters(); --> compiler error

  optionalPositionalParameters();
  optionalPositionalParameters(1);
  // optionalPositionalParameters(param: 1); --> compiler error

  positionalAndNamedParameters(1);
  positionalAndNamedParameters(1, optionalNamedParam: 2);
  // positionalNamedParameters(1, 2); --> compiler error

  positionalAndOptionalPositionalParameters(1);
  positionalAndOptionalPositionalParameters(1, 2);
  // positionalAndOptionalPositionalParameters(1, optionalPositionalParam: 2); --> compiler error
}
