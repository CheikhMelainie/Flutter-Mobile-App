import 'package:flutter/material.dart';
import 'package:frist_app/logic/controlors/auth_controller.dart';
import 'package:frist_app/logic/controlors/them_controller.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().ChangesTheme();
              },
              child: Text(
                "Dark Mode",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(builder: (controller) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "LogOut From App",
                    titleStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    middleText: 'Are you sure you need to logout',
                    middleTextStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.grey[300],
                    radius: 10,
                    textCancel: " No ",
                    cancelTextColor: Colors.white,
                    textConfirm: " Yes ",
                    confirmTextColor: Colors.white,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                },
                child: Text(
                  "LogOut",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
