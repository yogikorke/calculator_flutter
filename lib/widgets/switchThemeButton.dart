import 'package:calculator/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/theme_service.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          borderRadius: BorderRadius.circular(20),
          onTap: () => Get.isDarkMode ? ThemeService().switchTheme() : null,
          child: Icon(
            Icons.sunny,
            color: Get.isDarkMode ? colorGrey : Colors.black,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
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
