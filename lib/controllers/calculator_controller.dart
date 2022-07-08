import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var input = ''.obs;
  var result = '0'.obs;
  double _firstNum = 0;
  double _secondNum = 0;
  String operator = '';
  final List<String> userInput = [];

  void getUserInput(String int) {
    userInput.add(int);
    makeNumber();
  }

  void clearInput() {
    userInput.clear();
    result.value = '0';
    makeNumber();
  }

  void clearLastInput() {
    userInput.removeAt(userInput.length - 1);
    if (userInput.isEmpty) {
      result.value = '0';
    }
    makeNumber();
  }

  void makeNumber() {
    input.value = '';
    for (var num in userInput) {
      input.value += num;
    }
  }

  void _getOperator() {
    if (userInput[0] != '-') {
      if (input.contains('-')) operator = '-';
    } else if (userInput[0] == '-') {
      for (int i = 1; i < userInput.length; i++) {
        if (userInput[i].contains('-')) operator = '-';
      }
    }
    if (input.contains('+')) operator = '+';
    if (input.contains('/')) operator = '/';
    if (input.contains('x')) operator = 'x';
  }

  void _splitInput() {
    _getOperator();
    try {
      _firstNum = double.parse(input.split(operator)[0]);
      _secondNum = double.parse(input.split(operator)[1]);
    } catch (e) {
      print('DEBUG: Calculation error $e');
    }
  }

  void percent() {
    _firstNum = double.parse(input.value);
    result.value = (_firstNum / 100).toString();
  }

  void plusOrMinus() {
    if (!userInput.contains('-')) {
      userInput.insert(0, '-');
    } else {
      if (userInput[0] == '-') {
        userInput.removeAt(0);
      }
    }
    makeNumber();
  }

  void operation() {
    _splitInput();
    if (userInput[0] == '-') {
      _firstNum = -_firstNum;
    }

    if (input.contains('+')) {
      try {
        result.value = (_firstNum + _secondNum).toString();
      } catch (e) {
        print('DEBUG: Calculation error $e');
      }
    }
    if (input.contains('-')) {
      try {
        result.value = (_firstNum - _secondNum).toString();
      } catch (e) {
        print('DEBUG: Calculation error $e');
      }
    }

    if (input.contains('/')) {
      try {
        if (_secondNum > 0) {
          result.value = (_firstNum / _secondNum).toStringAsFixed(1);
        } else {
          print('DEBUG: second number is less than zero $_secondNum');
        }
      } catch (e) {
        print('DEBUG: Calculation error $e');
      }
    }

    if (input.contains('x')) {
      try {
        result.value = (_firstNum * _secondNum).toString();
      } catch (e) {
        print('DEBUG: Calculation error $e');
      }
    }
  }
}
