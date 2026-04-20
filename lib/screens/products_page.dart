import 'package:e_commerce_app/api/server.dart';
import 'package:e_commerce_app/screens/category_products.dart';
import 'package:e_commerce_app/screens/login_page.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/categorymodel.dart';
import 'package:e_commerce_app/widgets/custom_productcard.dart';
import 'package:e_commerce_app/widgets/products_model.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, this.id});
  final String? id;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductsModel> products = [];
  List<Categorymodel> categories = [];
  List<ProductsModel> filteredcategories = [];

  final ApiServer apiService = ApiServer();

  Future<void> callingapi() async {
    products = await apiService.getProducts();
    categories = await apiService.getCategory();
    setState(() {});
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
            child: GridView.builder(
              padding: EdgeInsets.only(left: 15, right: 15),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(products: product),
                      ),
                    );
                  },
                  child: CustomProductcard(productsmodel: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
