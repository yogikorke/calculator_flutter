import 'package:calculator/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.isDarkMode ? colorBlueDark : colorGrey,
      ),
      child: Center(
        child: Text(
          _getRightSign(index),
          style: TextStyle(
            color: _getSignColor(index),
            fontSize: _getSize(index),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  String _getRightSign(int index) {
    List<String> signs = [
      'AC',
      '+/-',
      '%',
      '/',
      'x',
      '-',
      '+',
      'AC',
      '0',
      '.',
      '='
    ];
    if (index >= 0 && index <= 3) return signs[index];
    if (index == 7) return signs[4];
    if (index == 11) return signs[5];
    if (index == 15) return signs[6];
    if (index == 16) return signs[7];
    if (index == 17) return signs[8];
    if (index == 18) return signs[9];
    if (index == 19) return signs[10];

    return _getRightNumber(index);
  }

  String _getRightNumber(int index) {
    List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    if (index == 4) return numbers[6];
    if (index == 5) return numbers[7];
    if (index == 6) return numbers[8];

    if (index == 8) return numbers[3];
    if (index == 9) return numbers[4];
    if (index == 10) return numbers[5];

    if (index == 12) return numbers[0];
    if (index == 13) return numbers[1];
    if (index == 14) return numbers[2];
    return '';
  }

  Color _getSignColor(int index) {
    if (index <= 2) return colorGreen;
    if (index == 3 || index == 7 || index == 11 || index == 15 || index == 19) {
      return colorRed;
    }
    return Get.isDarkMode ? Colors.white : Colors.black;
  }

  double _getSize(int index) {
    if (index >= 0 && index <= 3) return 26;
    if (index == 7 || index == 11 || index == 15 || index == 19) {
      return 26;
    }
    return 22;
  }
}
