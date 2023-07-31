import 'package:frist_app/model/product_model.dart';
import 'package:frist_app/services/product_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productlist = <ProductModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productlist.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
