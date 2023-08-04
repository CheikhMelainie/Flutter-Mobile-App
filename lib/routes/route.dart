import 'package:frist_app/logic/bindigns/product_bindigns.dart';
import 'package:frist_app/view/screens/auth/forgot_password_screen.dart';
import 'package:frist_app/view/screens/auth/login_screen.dart';
import 'package:frist_app/view/screens/auth/signup_screen.dart';
import 'package:frist_app/view/screens/cart_screen.dart';
import 'package:frist_app/view/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:frist_app/view/screens/Welcome_screen.dart';

import '../logic/bindigns/auth_binidings.dart';
import '../logic/bindigns/main_bindings.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBiniding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBiniding()),
    GetPage(
        name: Routes.forgotpasswordscreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBiniding()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBiniding(),
        MainBiniding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBiniding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotpasswordscreen = '/forgotpasswordscreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
