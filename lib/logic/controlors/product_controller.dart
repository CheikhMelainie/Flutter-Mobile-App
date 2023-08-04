import 'package:frist_app/model/product_model.dart';
import 'package:frist_app/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productlist = <ProductModels>[].obs;
  var favouritestlist = <ProductModels>[].obs;
  var isLoading = true.obs;
  var stoagre = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? stroredShopping = stoagre.read<List>("isFavourites");
    if (stroredShopping != null) {
      favouritestlist =
          stroredShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
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

//Logic for favorite screen

  void mangefavourites(int productId) async {
    var exitingIndex =
        favouritestlist.indexWhere((element) => element.id == productId);

    if (exitingIndex >= 0) {
      favouritestlist.removeAt(exitingIndex);
      await stoagre.remove("isFavourites");
    } else {
      favouritestlist
          .add(productlist.firstWhere((element) => element.id == productId));

      await stoagre.write("isFavourites", favouritestlist);
    }
  }

  bool isFavourite(int productId) {
    return favouritestlist.any((element) => element.id == productId);
  }
}
