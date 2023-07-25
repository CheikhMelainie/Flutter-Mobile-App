import 'package:frist_app/view/screens/auth/login_screen.dart';
import 'package:frist_app/view/screens/auth/signup_screen.dart';
import 'package:get/get.dart';
import 'package:frist_app/view/screens/Welcome_screen.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.welcomeScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: Routes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: Routes.signUpScreen, page: () => SignUpScreen()),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
}
