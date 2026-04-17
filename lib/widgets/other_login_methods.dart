import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherLoginMethods extends StatefulWidget {
  const OtherLoginMethods({super.key});

  @override
  State<OtherLoginMethods> createState() => _OtherLoginMethodsState();
}

class _OtherLoginMethodsState extends State<OtherLoginMethods> {
  bool isclicked = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Flexible(child: Divider(color: Colors.grey, thickness: 1)),
            TextStyles(
              text: '   Or With   ',
              fontSize: 14,
              appColor: AppColors.hinttext,
            ),
            Flexible(child: Divider(color: Colors.grey, thickness: 1)),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SvgPicture.asset('assets/icons/github.svg', height: 30),
                    SizedBox(width: 10),
                    TextStyles(
                      text: 'GitHub',
                      fontSize: 18,
                      appColor: AppColors.headding,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SvgPicture.asset('assets/icons/gitlab.svg', height: 30),
                    SizedBox(width: 10),
                    TextStyles(
                      text: 'GitLab',
                      fontSize: 18,
                      appColor: AppColors.headding,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
