import 'package:e_commerce_app/screens/login_page.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_header.dart';
import 'package:e_commerce_app/widgets/custom_labeled_textfield.dart';
import 'package:e_commerce_app/widgets/other_login_methods.dart';
import 'package:e_commerce_app/widgets/password_recovery.dart';
import 'package:e_commerce_app/widgets/signinandsignup_checker.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  title: 'Create an account',
                  subTitle: 'Connect with your friends today!',
                ),
                SizedBox(height: 55),
                CustomLabeledTextfield(
                  title: 'Email Address',
                  controller: emailController,
                ),
                SizedBox(height: 5),
                CustomLabeledTextfield(
                  title: 'Phone Number',
                  isPhonennum: true,
                  controller: phoneController,
                ),
                SizedBox(height: 5),
                CustomLabeledTextfield(
                  title: 'Password',
                  ispassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: 5),
                PasswordRecovery(),
                SizedBox(height: 10),
                CustomButton(title: 'SignUp', onPressed: () {}),
                SizedBox(height: 10),
                OtherLoginMethods(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SigninandsignupChecker(
        text: 'Already have an account ?',
        sign: 'Login',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }
}
