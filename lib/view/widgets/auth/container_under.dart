import 'package:flutter/material.dart';
import 'package:frist_app/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder({
    required this.text,
    required this.onPressed,
    required this.textType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : pinkClr,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            text: text,
            color: Colors.white,
            underline: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: textType,
              color: Colors.white,
              underline: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
