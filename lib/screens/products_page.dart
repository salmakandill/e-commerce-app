import 'package:e_commerce_app/api/server.dart';
import 'package:e_commerce_app/screens/login_page.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/custom_productcard.dart';
import 'package:e_commerce_app/widgets/products_model.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductsModel> products = [];
  final ApiServer apiService = ApiServer();

  Future<void> callingapi() async {
    products = await apiService.getProducts();
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
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
                          builder: (context) =>
                              ProductDetails(products: product),
                        ),
                      );
                    },
                    child: CustomProductcard(model: product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
