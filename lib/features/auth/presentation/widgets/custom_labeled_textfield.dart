import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomLabeledTextfield extends StatefulWidget {
  final String title;

  final bool isPhonennum;
  final bool ispassword;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final String? hinttext;
  final int? maxline;
  final String? Function(String?)? validator;
  const CustomLabeledTextfield({
    super.key,
    required this.title,
    required this.controller,
    this.suffixIcon,
    this.ispassword = false,
    this.isPhonennum = false,
    this.hinttext,
    this.maxline, this.validator,
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
          fontSize: 17,
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
            : TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.validator,
                controller: widget.controller,
                // maxLines: widget.maxline,
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
                  hintText: widget.hinttext ?? 'Enter ${widget.title}',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
      ],
    );
  }
}
