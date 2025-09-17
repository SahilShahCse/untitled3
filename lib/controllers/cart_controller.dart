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
      cartItems[index].count++;
      cartItems[index] = cartItems[index];
    } else {
      cartItems.add(CartItemModel.fromMap(product.toMap()));
    }

    totalAmount.value += product.price;
    cartItems.refresh();
    print('Added item $id, Cart: ${cartItems.map((item) => "${item.id}: ${item.count}").toList()}');
  }

  void removeItem(int id) {
    final index = cartItems.indexWhere((item) => item.id == id);

    if (index >= 0) {
      final item = cartItems[index];

      if (item.count > 1) {

        item.count--;
        cartItems[index] = item;
        totalAmount.value -= item.price;
      } else {
        totalAmount.value -= item.price;
        cartItems.removeAt(index);
      }

      cartItems.refresh();
      print('Removed item $id, Cart: ${cartItems.map((item) => "${item.id}: ${item.count}").toList()}');
    }
  }


}