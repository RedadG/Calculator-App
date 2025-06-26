enum Operator{sum, rest, mult, div}

class Calculate {
  dynamic _result = 0;
  String _screenResult = '';
  String _numsAbove = '';

  dynamic get result => _result;
  String get screenResult => _screenResult;
  String get numsAbove => _numsAbove;

  void _cleanScreen() {
    _numsAbove = '';
    _screenResult = '';
  }

  void reset() {
    _result = 0;
    _screenResult = '';
    _numsAbove = '';
  }

  void deleteNums() {
    _numsAbove = _numsAbove.substring(0, _numsAbove.length - 1);
  }

  void addNumAbove({required String number}) {
    _numsAbove += number;
  }

  void updateScreenResult({required Operator operator}) {
    switch(operator) {

      case Operator.sum:
        _screenResult = '$_result +';
        break;
      case Operator.rest:
        _screenResult = '$_result -';
        break;
      case Operator.mult:
        _screenResult = '$_result x';
        break;
      case Operator.div:
        _screenResult = '$_result /';
        break;
    }
  }

  void isNotCalculating({required Operator operator}) {
    sum();
    updateScreenResult(operator: operator);
  }

  void sum() {
    int? numsAboveInt = int.parse(_numsAbove);
    _result += numsAboveInt;
    _cleanScreen();

  }

  void calculatingSum() {
    sum();
    updateScreenResult(operator: Operator.sum);
  }


  void rest() {

    int? numsAboveInt = int.parse(_numsAbove);
    _result -= numsAboveInt;
    _cleanScreen();

  }

  void calculatingRest() {
    rest();
    updateScreenResult(operator: Operator.rest);
  }

  void mult() {

    int? numsAboveInt = int.parse(_numsAbove);
    _result *= numsAboveInt;
    _cleanScreen();

  }

  void calculatingMult() {
    mult();
    updateScreenResult(operator: Operator.mult);
  }

  void div() {

    int? numsAboveInt = int.parse(_numsAbove);
    _result /= numsAboveInt;
    _cleanScreen();

  }

  void calculatingDiv() {
    div();
    updateScreenResult(operator: Operator.div);
  }

}
