import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/auth/presentation/Screens/login_page.dart';
// import 'package:e_commerce_app/screens/myprofile_page.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_header.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_labeled_textfield.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/other_login_methods.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/password_recovery.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/signinandsignup_checker.dart';
// import 'package:e_commerce_app/widgets/string_manager.dart';
import 'package:e_commerce_app/features/auth/data/validators.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isloading = false;
  Dio dio = Dio();
  Future<void> signup() async {
    setState(() {
      isloading = true;
    });
    try {
      final response = await dio.post(
        'https://api.escuelajs.co/api/v1/users/',
        data: {
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "avatar": "https://picsum.photos/800",
        },
      );
      log('Response: $response');
      setState(() {
        isloading = false;
      });
    } on DioException catch (e) {
      log('Error Dio: ${e.response?.data['message']}');
      setState(() {
        isloading = false;
      });
    } on Exception catch (e) {
      log('Error :$e');
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
                    title: 'Create an account',
                    subTitle: 'Connect with your friends today!',
                  ),
                  SizedBox(height: 55),

                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/800',
                      ),
                      radius: 60,
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomLabeledTextfield(
                    title: 'Name',
                    controller: nameController,
                    validator: (name) {
                      return Validator.validateUserName(name ?? '');
                    },
                  ),
                  SizedBox(height: 4),
                  CustomLabeledTextfield(
                    title: 'Email Address',
                    controller: emailController,
                    validator: (emailvalue) {
                      return Validator.validateEmail(emailvalue ?? '');
                    },
                  ),

                  SizedBox(height: 4),
                  CustomLabeledTextfield(
                    title: 'Password',
                    ispassword: true,
                    controller: passwordController,
                    validator: (passwordvalue) {
                      return Validator.validatePassword(passwordvalue ?? '');
                    },
                  ),
                  SizedBox(height: 5),
                  PasswordRecovery(),
                  SizedBox(height: 10),
                  CustomButton(
                    title: isloading ? 'Loading....' : 'SignUp',
                    onPressed: () {
                      
                      if (formKey.currentState!.validate()) {
                        signup();
                        log('email: ${emailController.text}');
                        log('Phone: ${nameController.text}');
                        log('Password: ${passwordController.text}');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MyprofilePage(),
                        //   ),
                        // );
                      } else {
                        log('Validation Fiales');
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  OtherLoginMethods(),
                ],
              ),
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
