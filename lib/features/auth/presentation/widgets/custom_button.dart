import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 155),
        backgroundColor: AppColors.buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: TextStyles(
        text: widget.title,
        fontSize: 17,
        appColor: AppColors.whitecolor,
      ),
    );
  }
}
