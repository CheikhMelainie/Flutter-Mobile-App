import 'package:flutter/material.dart';
import 'package:frist_app/view/widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/theme.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Get.isDarkMode
                ? Image.asset('assests/images/check.png')
                : Icon(
                    Icons.done,
                    color: pinkClr,
                    size: 30,
                  ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            TextUtils(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              text: "I accept ",
              color: Get.isDarkMode ? Colors.black : Colors.white,
              underline: TextDecoration.none,
            ),
            TextUtils(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              text: "terms & conditions",
              color: Get.isDarkMode ? Colors.black : Colors.white,
              underline: TextDecoration.underline,
            ),
          ],
        ),
      ],
    );
  }
}
