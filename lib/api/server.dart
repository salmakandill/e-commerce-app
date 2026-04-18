import 'package:dio/dio.dart';
import 'package:e_commerce_app/widgets/products_model.dart';


class ApiServer {
  final Dio dio = Dio();
  Future<List<ProductsModel>> getProducts() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/products');
    List<ProductsModel> products = [];
    for (var element in response.data) {
      final ProductsModel product = ProductsModel.getfromjson(element);
      products.add(product);
    }
    return products;
  }
}
