
import 'package:e_commerce_app/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ECommerceAPP());
}

class ECommerceAPP extends StatelessWidget {
  const ECommerceAPP({super.key});
  static const maincolor = Color.fromARGB(255, 130, 96, 139);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Manrope'),
      home: LoginPage(),
    );
  }
}
