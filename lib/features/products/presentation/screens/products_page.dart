import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/server.dart';
import 'package:e_commerce_app/features/products/presentation/screens/category_products.dart';
import 'package:e_commerce_app/features/auth/presentation/Screens/login_page.dart';
import 'package:e_commerce_app/features/products/presentation/screens/product_details.dart';
import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/models/categorymodel.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/custom_productcard.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, this.id});
  final String? id;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<ProductsModel>> products;
  List<Categorymodel> categories = [];
  List<ProductsModel> filteredcategories = [];

  final ApiServer apiService = ApiServer();

  Future<void> callingapi() async {
    products = apiService.getProducts();
    categories = await apiService.getCategory();
    setState(() {});
  }

  bool isLoading = false;
  Dio dio = Dio();
  Future<void> deleteproduct(int id) async {
    try {
      final response = await dio.delete(
        'https://api.escuelajs.co/api/v1/products/${id}',
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Product has been deleted')));
    } on DioException catch (e) {
      log('Error Dio: ${e.response?.data['message']}');
    } on Exception catch (e) {
      log('Error ${e}');
    }
  }

  @override
  void initState() {
    super.initState();
    callingapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          style: IconButton.styleFrom(iconSize: 30),
        ),
        title: TextStyles(
          text: 'Products',
          fontSize: 25,
          appColor: AppColors.headding,
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categories[index];
                  return SizedBox(
                    width: 130,
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProducts(
                              name: categories[index].name,
                              slug: categories[index].slug!,
                            ),
                          ),
                        );
                        final selectedCategory = categories[index];
                        filteredcategories = await apiService
                            .getFilteredcategory(slug: selectedCategory.slug!);
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(category.image),
                          ),
                          Text(
                            category.name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: FutureBuilder(
              future: products,
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapShot.hasData) {
                  final products = snapShot.data;
                  return GridView.builder(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    itemCount: products!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(products: products[index]),
                            ),
                          );
                        },
                        child: CustomProductcard(
                          productsmodel: products[index],
                          onPressed: () async {
                            await deleteproduct(products[index].id);
                            await ApiServer().getProducts();
                            setState(() {});
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Text('Error', style: TextStyle(fontSize: 30));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
