import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class SigninandsignupChecker extends StatefulWidget {
  const SigninandsignupChecker({super.key, this.text, this.sign, this.onPressed});
  final String? text, sign;
  final void Function()? onPressed;

  @override
  State<SigninandsignupChecker> createState() => _SigninandsignupCheckerState();
}

class _SigninandsignupCheckerState extends State<SigninandsignupChecker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextStyles(
          text: widget.text!,
          fontSize: 17,
          appColor: AppColors.hinttext,
        ),

        TextButton(
          onPressed: widget.onPressed,
          child: TextStyles(
            text: widget.sign!,
            fontSize: 17,
            appColor: AppColors.buttonColor,
          ),
        ),
      ],
    );
  }
}
