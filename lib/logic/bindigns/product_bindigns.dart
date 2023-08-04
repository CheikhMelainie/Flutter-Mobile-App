import 'package:frist_app/logic/controlors/cart_controller.dart';
import 'package:frist_app/logic/controlors/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
  }
}
