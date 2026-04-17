import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomLabeledTextfield extends StatefulWidget {
  final String title;
  final IconButton? suffixIcon;
  final bool isPhonennum;
  final bool ispassword;
  final TextEditingController controller;
  const CustomLabeledTextfield({
    super.key,
    required this.title,
    this.suffixIcon,
    this.ispassword = false,
    this.isPhonennum = false,
    required this.controller,
  });

  @override
  State<CustomLabeledTextfield> createState() => _CustumLabeledTextfieldState();
}

class _CustumLabeledTextfieldState extends State<CustomLabeledTextfield> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles(
          text: widget.title,
          fontSize: 14,
          appColor: AppColors.buttonColor,
        ),
        SizedBox(height: 10),
        widget.isPhonennum
            ? IntlPhoneField(
                controller: widget.controller,
                initialCountryCode: 'EG',
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                onChanged: (phone) {},
              )
            : TextField(
                controller: widget.controller,
                obscureText: widget.ispassword ? !isVisable : isVisable,
                decoration: InputDecoration(
                  suffixIcon: widget.ispassword
                      ? IconButton(
                          icon: Icon(
                            isVisable ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            isVisable = !isVisable;
                            setState(() {});
                          },
                        )
                      : null,
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your ${widget.title}',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
      ],
    );
  }
}
