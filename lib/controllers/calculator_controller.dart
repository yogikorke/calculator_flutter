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

  void makeNumber() {
    input.value = '';
    for (var num in userInput) {
      input.value += num;
    }
  }

  void _getOperator() {
    if (input.contains('+')) operator = '+';
    if (input.contains('-')) operator = '-';
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

  // void history(int count) {
  //   if (count == 2) {
  //     if (result.value != '0') {
  //       input.value = result.value;
  //       result.value = '0';
  //     }
  //   }
  // }

  void operation() {
    _splitInput();
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
