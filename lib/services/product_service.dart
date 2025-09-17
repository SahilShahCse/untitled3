import 'package:untitled3/services/api.dart';

import '../models/product_model.dart';

class ProductService{

  static Future<List<ProductModel>> getProducts() async {
    var res = await Api.getMethod('products');

    return (res['data'] as List).map((e) => ProductModel.fromMap(e)).toList();
  }

}