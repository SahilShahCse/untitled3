import 'package:get/get.dart';
import 'package:untitled3/models/cart_item_model.dart';
import 'package:untitled3/controllers/product_controller.dart';

class CartController extends GetxController {
  final RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  RxDouble totalAmount = RxDouble(0.0);

  void addItem(int id) {
    final productController = Get.find<ProductController>();
    final product = productController.products.firstWhereOrNull((p) => p.id == id);

    if (product == null) {
      print('Error: Product with id $id not found');
      return;
    }

    final index = cartItems.indexWhere((item) => item.id == id);

    if (index >= 0) {
      // Item exists: increment count
      cartItems[index].count++;
      cartItems[index] = cartItems[index]; // Force update
    } else {
      // Item does not exist: add new
      cartItems.add(CartItemModel.fromMap(product.toMap()));
    }

    totalAmount.value += product.price;
    cartItems.refresh();
    print('Added item $id, Cart: ${cartItems.map((item) => "${item.id}: ${item.count}").toList()}');
  }

  void removeItem(int id) {
    final index = cartItems.indexWhere((item) => item.id == id);

    if (index >= 0) {
      if (cartItems[index].count > 1) {
        // Decrease count if more than 1
        cartItems[index].count--;
        cartItems[index] = cartItems[index]; // Force update
      } else {
        // Remove item if count is 1
        totalAmount.value -= cartItems[index].price;
        cartItems.removeAt(index);
      }
      totalAmount.value -= cartItems[index].price;
      cartItems.refresh();
      print('Removed item $id, Cart: ${cartItems.map((item) => "${item.id}: ${item.count}").toList()}');
    }
  }


}