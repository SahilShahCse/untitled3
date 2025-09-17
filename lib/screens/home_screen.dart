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
      bottomNavigationBar: Obx(() {
        if (cartController.cartItems.isEmpty) return const SizedBox();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SafeArea(
            child: FilledButton(
              onPressed: () {
                Get.to(() => CheckoutScreen());
              },
              child: Text('Cart'),
            ),
          ),
        );
      }),

      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = controller.products[index];

              return Obx(() {
                final isInCart = cartController.cartItems.any(
                  (item) => item.id == product.id,
                );

                return ListTile(
                  leading: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(product.image, fit: BoxFit.cover),
                    ),
                  ),
                  title: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "₹${product.price}",
                    style: const TextStyle(color: Colors.black54),
                  ),
                  trailing: isInCart
                      ? AddSubItem(id: product.id)
                      : InkWell(
                          onTap: () {
                            cartController.addItem(product.id);
                          },
                          child: const AddItemButton(),
                        ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
