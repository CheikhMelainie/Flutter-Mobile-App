import 'package:flutter/material.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:frist_app/view/widgets/cart/cart_product_card.dart';
import 'package:frist_app/view/widgets/cart/empty_cart.dart';
import 'package:frist_app/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: "Total",
                color: Colors.grey,
                underline: TextDecoration.none,
              ),
              Text(
                "\*199",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Check Out",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
