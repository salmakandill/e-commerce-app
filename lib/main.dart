import 'package:e_commerce_app/widgets/buttom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ECommerceAPP());
}

class ECommerceAPP extends StatelessWidget {
  const ECommerceAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Manrope'),
      home: ButtomNavigationBar(),
    );
  }
}
