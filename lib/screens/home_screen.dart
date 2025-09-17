import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:untitled3/controllers/cart_controller.dart';
import 'package:untitled3/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:untitled3/screens/checkout_screen.dart';

import '../widgets/add_item_button.dart';
import '../widgets/add_sub_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ProductController controller;
  late final CartController cartController;

  @override
  void initState() {
    super.initState();

    controller = Get.find<ProductController>();
    cartController = Get.isRegistered<CartController>()
        ? Get.find<CartController>()
        : Get.put(CartController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => cartController.cartItems.isNotEmpty
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(() => CheckoutScreen());
                },
                backgroundColor: Colors.teal,
                child: Icon(CupertinoIcons.cart, color: Colors.white),
              )
            : SizedBox(),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = controller.products[index];
              final isInCart = cartController.cartItems.any(
                (item) => item.id == product.id,
              );
              return ListTile(
                leading: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(product.image),
                ),
                title: Text(product.title, overflow: TextOverflow.ellipsis),
                subtitle: Text(product.price.toString()),
                trailing: isInCart
                    ? AddSubItem(id: product.id)
                    : InkWell(
                        onTap: () {
                          cartController.addItem(product.id);
                        },
                        child: const AddItemButton(),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
