import 'package:e_commerce_app/features/products/presentation/screens/addproducts_page.dart';
import 'package:e_commerce_app/features/products/presentation/screens/products_page.dart';
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
      home: ProductsPage(),
    );
  }
}
