import 'package:calculator/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_button.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({Key? key}) : super(key: key);

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
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              //operation
            },
            child: CustomButton(index: index),
          );
        },
      ),
    );
  }
}
