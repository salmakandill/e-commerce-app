import 'package:e_commerce_app/screens/login_page.dart';
import 'package:e_commerce_app/screens/myprofile_page.dart';
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
  List<ProductsModel> products = [
    ProductsModel(
      imageurl: 'assets/images/watch.jpg',
      title: 'Watch',
      price: '\$646',
    ),
    ProductsModel(
      imageurl: 'assets/images/shoes.jpg',
      title: 'Nike Shoes',
      price: '\$66',
    ),
    ProductsModel(
      imageurl: 'assets/images/lgtv.jpg',
      title: 'LG TV',
      price: '\$66',
    ),
    ProductsModel(
      imageurl: 'assets/images/airpods.jpg',
      title: 'Airpods',
      price: '\$66',
    ),
    ProductsModel(
      imageurl: 'assets/images/hoodie.jpg',
      title: 'Hoodie',
      price: '\$60',
    ),
    ProductsModel(
      imageurl: 'assets/images/jacket.jpg',
      title: 'Jacket',
      price: '\$80',
    ),
    ProductsModel(
      imageurl: 'assets/images/watch.jpg',
      title: 'Watch',
      price: '\$646',
    ),
    ProductsModel(
      imageurl: 'assets/images/shoes.jpg',
      title: 'Shoes',
      price: '\$66',
    ),
    ProductsModel(
      imageurl: 'assets/images/lgtv.jpg',
      title: 'LG TV',
      price: '\$66',
    ),
    ProductsModel(
      imageurl: 'assets/images/airpods.jpg',
      title: 'Airpods',
      price: '\$66',
    ),
    ProductsModel(
      imageurl: 'assets/images/hoodie.jpg',
      title: 'Hoodie',
      price: '\$60',
    ),
    ProductsModel(
      imageurl: 'assets/images/jacket.jpg',
      title: 'Jacket',
      price: '\$80',
    ),
  ];

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyprofilePage()),
              );
            },
            icon: Icon(Icons.person),
            style: IconButton.styleFrom(iconSize: 30),
          ),
        ],
      ),

      body: GridView.builder(
        padding: EdgeInsets.only(left: 15, right: 15),
        itemCount: products.length,
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
            child: CustomProductcard(productmodel: products[index]),
          );
        },
      ),
    );
  }
}
