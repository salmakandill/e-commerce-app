import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class CustomProductcard extends StatefulWidget {
  final ProductsModel productsmodel;
  const CustomProductcard({super.key, required this.productsmodel});

  @override
  State<CustomProductcard> createState() => _CustomProductcardState();
}

class _CustomProductcardState extends State<CustomProductcard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    widget.productsmodel.imageurl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                    errorBuilder:(context,error,stackTrace){
                        return Center(child: Icon(Icons.broken_image, size: 35));
                    }
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productsmodel.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        TextStyles(
                          text: widget.productsmodel.price.toString(),
                          fontSize: 20,
                          appColor: AppColors.buttonColor,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(iconSize: 35),
                    color: AppColors.buttonColor,
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
