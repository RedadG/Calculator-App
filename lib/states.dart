enum Enumstate { sum, rest, mult, div, calculating }

class CalculatingState {
  bool _isCalculating = false;
  bool _isSumin = false;
  bool _isRestin = false;
  bool _isDiv = false;
  bool _isMult = false;

  bool get isCalculating => _isCalculating;
  bool get isSumin => _isSumin;
  bool get isRestin => _isRestin;
  bool get isDiv => _isDiv;
  bool get isMult => _isMult;

  void resetAllStates() {
    _isCalculating = false;
    _isSumin = false;
    _isRestin = false;
    _isDiv = false;
    _isMult = false;
  }

  void resetAllStatesButCalculating() {
    _isSumin = false;
    _isRestin = false;
    _isDiv = false;
    _isMult = false;
  }

  void activateState({required Enumstate state}) {
    switch (state) {
      case Enumstate.sum:
        _isSumin = true;
        break;

      case Enumstate.rest:
        _isRestin = true;
        break;

      case Enumstate.mult:
        _isMult = true;
        break;

      case Enumstate.div:
        _isDiv = true;
        break;

      case Enumstate.calculating:
        _isCalculating = true;
        break;
    }
  }

  void deactivateState({required Enumstate state}) {
    switch (state) {
      case Enumstate.sum:
        _isSumin = false;
        break;

      case Enumstate.rest:
        _isRestin = false;
        break;

      case Enumstate.mult:
        _isMult = false;
        break;

      case Enumstate.div:
        _isDiv = false;
        break;

      case Enumstate.calculating:
        _isCalculating = false;
        break;
    }
  }
}
