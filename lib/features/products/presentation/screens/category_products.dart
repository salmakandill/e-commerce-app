import 'package:e_commerce_app/api/server.dart';
import 'package:e_commerce_app/features/products/presentation/screens/product_details.dart';
import 'package:e_commerce_app/models/categorymodel.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/custom_productcard.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({super.key, required this.name, required this.slug});
  final String name, slug;
  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  List<ProductsModel> products = [];
  List<Categorymodel> categories = [];
  List<ProductsModel> filteredProducts = [];

  final ApiServer apiService = ApiServer();
  bool isloading = true;
  Future<void> callingapi() async {
    products = await apiService.getProducts();
    filteredProducts = await apiService.getFilteredcategory(slug: widget.slug);
    setState(() {
      if (filteredProducts.isEmpty) {
        isloading;
      } else {
        isloading = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    callingapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name), centerTitle: true),
      body: Expanded(
        flex: 4,
        child: isloading
            ? Center(child: CircularProgressIndicator())
            : filteredProducts.isEmpty
            ? Center(
                child: Text(
                  'Products not found',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
              )
            : GridView.builder(
                padding: EdgeInsets.only(left: 15, right: 15),
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(products: product),
                        ),
                      );
                    },
                    child: CustomProductcard(
                      productsmodel: filteredProducts[index],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
