import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/products_model.dart';
// import 'package:e_commerce_app/widgets/products_model.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class CustomProductcard extends StatefulWidget {
  final ProductsModel model;
  const CustomProductcard({super.key, required this.model});

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
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    widget.model.imageurl,
                    fit: BoxFit.cover,
                    width: double.infinity,
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
            flex: 4,
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
                          widget.model.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        TextStyles(
                          text: widget.model.price,
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
