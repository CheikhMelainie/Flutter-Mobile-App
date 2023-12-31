import 'package:flutter/material.dart';
import 'package:frist_app/logic/controlors/product_controller.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          if (controller.favouritestlist.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assests/images/heart.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please, Add your favorites products.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black12,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  image: controller.favouritestlist[index].image,
                  price: controller.favouritestlist[index].price,
                  title: controller.favouritestlist[index].title,
                  productId: controller.favouritestlist[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favouritestlist.length,
            );
          }
        },
      ),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.mangefavourites(productId);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
