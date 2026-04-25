import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/auth/data/validators.dart';
import 'package:e_commerce_app/features/auth/presentation/Screens/signup_page.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_header.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_labeled_textfield.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/other_login_methods.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/password_recovery.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/signinandsignup_checker.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isloading = false;
  Dio dio = Dio();
  Future<void> login() async {
    try {
      setState(() {
        isloading = true;
      });
      final response = await dio.post(
        'https://api.escuelajs.co/api/v1/auth/login',
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      log('Response: $response');
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Success')));
    } on DioException catch (e) {
      log('Error Dio: ${e.response?.data['message']}');

      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Failed')));
    } on Exception catch (e) {
      log('Error${e}');

      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    controller: emailController,
                    validator: (emailValue) {
                      return Validator.validateEmail(emailValue ?? '');
                    },
                  ),
                  SizedBox(height: 10),
                  CustomLabeledTextfield(
                    title: 'Password',
                    ispassword: true,
                    controller: passwordController,
                    validator: (passValue) {
                      return Validator.validatePassword(passValue ?? '');
                    },
                  ),
                  SizedBox(height: 10),
                  PasswordRecovery(),
                  SizedBox(height: 20),
                  CustomButton(
                    title: isloading ? 'loading ...' : 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        login();
                        log('email: ${emailController.text}');
                        log('Password: ${passwordController.text}');
                      } else {
                        log('Validation Fiales');
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                  SizedBox(height: 15),
                  OtherLoginMethods(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SigninandsignupChecker(
          text: "Don’t have an account ?",
          sign: 'Sign Up',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
          },
        ),
      ),
    );
  }
}
