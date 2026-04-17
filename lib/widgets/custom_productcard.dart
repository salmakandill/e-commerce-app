import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/products_model.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class CustomProductcard extends StatefulWidget {
  final ProductsModel productmodel;
  const CustomProductcard({super.key, required this.productmodel});

  @override
  State<CustomProductcard> createState() => _CustomProductcardState();
}

class _CustomProductcardState extends State<CustomProductcard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                widget.productmodel.imageurl,
                fit: BoxFit.cover,
                height: 134,
                width: 185,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyles(
                        text: widget.productmodel.title,
                        fontSize: 20,
                        appColor: AppColors.headding,
                      ),
                      TextStyles(
                        text: widget.productmodel.price,
                        fontSize: 20,
                        appColor: AppColors.buttonColor,
                      ),
                    ],
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
          ],
        ),
      ),
    );
  }
}
