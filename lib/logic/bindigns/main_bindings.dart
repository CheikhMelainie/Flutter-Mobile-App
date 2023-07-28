import 'package:frist_app/logic/controlors/main_controller.dart';
import 'package:get/get.dart';

class MainBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
