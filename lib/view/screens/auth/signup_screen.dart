import 'package:flutter/material.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:frist_app/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../widgets/auth/auth_Text_From_Field.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "SIGN",
                            color: Get.isDarkMode ? mainColor : pinkClr,
                            underline: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "UP",
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underline: TextDecoration.none,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFromFiled(
                        controller: nameController,
                        obscureText: false,
                        validator: () {},
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assests/images/user.png')
                            : Icon(
                                Icons.person,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(""),
                        hintText: 'User Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFromFiled(
                        controller: emailController,
                        obscureText: false,
                        validator: () {},
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assests/images/email.png')
                            : Icon(
                                Icons.email,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(""),
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFromFiled(
                        controller: passwordController,
                        obscureText: true,
                        validator: () {},
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assests/images/lock.png')
                            : Icon(
                                Icons.lock,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(""),
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthButton(
                        onPressed: () {},
                        text: 'SIGN UP',
                      ),
                    ],
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an Account? ',
                textType: 'log in',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
