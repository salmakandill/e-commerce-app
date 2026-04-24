import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          focusColor: Colors.grey,
          checkColor: AppColors.buttonColor,
          activeColor: Colors.white,

          value: isChecked,
          onChanged: (newvalue) {
            isChecked = newvalue;
            setState(() {});
          },
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
          onPressed: () {
            isChecked = !isChecked!;
            setState(() {});
          },
          child: TextStyles(
            text: 'Remember Me',
            fontSize: 17,
            appColor: AppColors.blueblackshade,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scaffold()),
            );
          },
          child: TextStyles(
            text: 'Forgot Password',
            fontSize: 17,
            appColor: AppColors.aredshade,
          ),
        ),
      ],
    );
  }
}
