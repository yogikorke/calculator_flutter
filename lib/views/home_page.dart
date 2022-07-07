import 'package:calculator/services/theme_service.dart';
import 'package:calculator/widgets/body_container.dart';
import 'package:calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_switchTheme(), BodyContainer(child: _keyboard())],
        ),
      ),
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

  Widget _switchTheme() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Get.isDarkMode ? colorBlue : colorGrey,
        ),
        child: _switchThemeButton(),
      ),
    );
  }

  Widget _switchThemeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => Get.isDarkMode ? ThemeService().switchTheme() : null,
          child: Icon(
            Icons.sunny,
            color: Get.isDarkMode ? colorGrey : Colors.black,
          ),
        ),
        InkWell(
          onTap: () => Get.isDarkMode ? null : ThemeService().switchTheme(),
          child: Icon(
            Icons.nightlight_round,
            color: Get.isDarkMode ? Colors.white : colorGrey,
          ),
        ),
      ],
    );
  }
}
