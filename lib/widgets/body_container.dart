import 'package:calculator/constants.dart';
import 'package:calculator/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';
import 'custom_button.dart';

class BodyContainer extends StatelessWidget {
  BodyContainer({Key? key}) : super(key: key);

  final CalculatorController _controller = Get.find<CalculatorController>();
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.62,
      width: Get.size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Get.isDarkMode ? colorBlue : colorGrey,
      ),
      child: _keyboard(),
    );
  }

  Widget _keyboard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: signAndNumbers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (signAndNumbers[index] != "AC" &&
                  signAndNumbers[index] != "=" &&
                  signAndNumbers[index] != "CRL" &&
                  signAndNumbers[index] != "+/-" &&
                  signAndNumbers[index] != "%") {
                _controller.getUserInput(signAndNumbers[index].toString());
              }
              if (signAndNumbers[index] == "%") {
                _controller.percent();
              }

              if (signAndNumbers[index] == "+/-") {
                _controller.plusOrMinus();
              }

              if (signAndNumbers[index] == "CRL") {
                _controller.clearLastInput();
              }

              if (signAndNumbers[index] == "AC") {
                _controller.clearInput();
              }
              if (signAndNumbers[index] == "=") {
                // if (count == 2) {
                //   //_controller.history(count);
                //   count = 0;
                //   return;
                // }

                //if (count == 1) {
                _controller.operation();
                // count += 1;
                //}
              }
            },
            child: CustomButton(index: index),
          );
        },
      ),
    );
  }
}
