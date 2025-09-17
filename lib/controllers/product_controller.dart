import 'package:get/get.dart';
import 'package:untitled3/models/product_model.dart';
import 'package:untitled3/services/product_service.dart';

class ProductController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxList<ProductModel> products = <ProductModel>[].obs;

  ProductController(){
    getProducts();
  }

  Future<void> getProducts() async {

    isLoading.value = true;

    try {
      products.addAll(await ProductService.getProducts());
      print(products[1].image);
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(message: e.toString()),
      );
    }finally{
      isLoading.value = true;
    }
  }
}
