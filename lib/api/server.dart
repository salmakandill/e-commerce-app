import 'package:dio/dio.dart';
import 'package:e_commerce_app/widgets/categorymodel.dart';
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

  Future<List<Categorymodel>> getCategory() async {
    final response = await dio.get(
      'https://api.escuelajs.co/api/v1/categories',
    );
    List<Categorymodel> categories = [];
    for (var element in response.data) {
      final Categorymodel category = Categorymodel.getfromjson(element);
      categories.add(category);
    }
    return categories;
  }

  Future<List<ProductsModel>> getFilteredcategory({required String slug}) async {
    final response = await dio.get(
      'https://api.escuelajs.co/api/v1/products/?categorySlug=$slug',
    );
    List<ProductsModel> filteredcategories = [];
    for (var element in response.data) {
      final ProductsModel product = ProductsModel.getfromjson(element);
      filteredcategories.add(product);
    }
    return filteredcategories;
  }

  
}
