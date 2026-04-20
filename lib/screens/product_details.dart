import 'package:e_commerce_app/screens/products_page.dart';
import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/products_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final ProductsModel products;
  const ProductDetails({super.key, required this.products});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isfav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      ),
                      child: Image.network(
                        widget.products.imageurl,
                        width: double.infinity,
                        height: 450,
                        fit: BoxFit.cover,
                        errorBuilder:(context,error,stackTrace){
                        return Center(child: Icon(Icons.broken_image, size: 35));
                    }
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 15,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 15,
                      child: IconButton(
                        onPressed: () {
                          isfav = !isfav;
                          setState(() {});
                        },
                        icon: Icon(
                          isfav ? Icons.favorite : Icons.favorite_border_sharp,
                        ),
                        iconSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.products.title,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 35, color: Colors.amber),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                ' (20 Review)',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Text(
                      widget.products.price.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: AppColors.iconscolor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  widget.products.description,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: AppColors.hinttext,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 90),
                backgroundColor: Color(0xFF6055D8),
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 45),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag),
              iconSize: 35,
              color: AppColors.hinttext,
            ),
          ],
        ),
      ),
    );
  }
}
