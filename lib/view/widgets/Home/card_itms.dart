import 'package:flutter/material.dart';
import 'package:frist_app/logic/controlors/product_controller.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:frist_app/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
            itemCount: controller.productlist.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                image: controller.productlist[index].image,
                price: controller.productlist[index].price,
                rate: controller.productlist[index].rating.rate,
                productId: controller.productlist[index].id,
              );
            },
          ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.mangefavourites(productId);
                    },
                    icon: controller.isFavourite(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            text: "$rate",
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
