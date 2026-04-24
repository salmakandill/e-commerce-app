import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, required this.subTitle});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles(text: title, fontSize: 25, appColor: AppColors.headding),
        TextStyles(text: subTitle, fontSize: 14, appColor: AppColors.hinttext),
      ],
    );
  }
}
