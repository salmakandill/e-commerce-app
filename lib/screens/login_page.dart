import 'package:e_commerce_app/screens/homepae.dart';
import 'package:e_commerce_app/screens/signup_page.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_header.dart';
import 'package:e_commerce_app/widgets/custom_labeled_textfield.dart';
import 'package:e_commerce_app/widgets/other_login_methods.dart';
import 'package:e_commerce_app/widgets/password_recovery.dart';
import 'package:e_commerce_app/widgets/signinandsignup_checker.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  title: 'Hi, Wecome Back! 👋',
                  subTitle: 'Hello again, you’ve been missed!',
                ),
                SizedBox(height: 67),
                CustomLabeledTextfield(
                  title: 'Email',
                  controller: widget.emailController,
                ),
                SizedBox(height: 10),
                CustomLabeledTextfield(
                  title: 'Password',
                  ispassword: true,
                  controller: widget.passwordController,
                ),
                SizedBox(height: 10),
                PasswordRecovery(),
                SizedBox(height: 20),
                CustomButton(
                  title: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                SizedBox(height: 15),
                OtherLoginMethods(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SigninandsignupChecker(
        text: "Don’t have an account ?",
        sign: 'Sign Up',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
      ),
    );
  }
}
