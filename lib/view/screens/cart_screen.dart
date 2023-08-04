import 'package:flutter/material.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:frist_app/view/widgets/cart/cart_product_card.dart';
import 'package:frist_app/view/widgets/cart/cart_total.dart';
import 'package:frist_app/view/widgets/cart/empty_cart.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CartProductCard();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CartTotal(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
