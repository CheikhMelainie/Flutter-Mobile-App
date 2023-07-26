import 'package:frist_app/logic/controlors/auth_controller.dart';
import 'package:get/get.dart';

class AuthBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
