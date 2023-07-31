import 'package:flutter/material.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:frist_app/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../widgets/Home/card_itms.dart';
import '../widgets/Home/search_text_from.dart';

class HommeScreen extends StatelessWidget {
  const HommeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      text: "Find your",
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      text: "INSPIRATIONS",
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchFromText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: "Categories",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
