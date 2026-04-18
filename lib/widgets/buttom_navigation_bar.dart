import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/screens/myprofile_page.dart';
import 'package:e_commerce_app/screens/products_page.dart';
import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:flutter/material.dart';


class ButtomNavigationBarIcons extends StatefulWidget {
  const ButtomNavigationBarIcons({super.key});

  @override
  State<ButtomNavigationBarIcons> createState() =>
      _ButtomNavigationBarIconsState();
}

class _ButtomNavigationBarIconsState extends State<ButtomNavigationBarIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 10,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.home),
          style: IconButton.styleFrom(iconSize: 35),
          color: AppColors.hinttext,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          style: IconButton.styleFrom(iconSize: 35),
          color: AppColors.hinttext,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductsPage()),
            );
          },
          icon: Icon(Icons.shopping_bag),
          style: IconButton.styleFrom(iconSize: 35),
          color: AppColors.hinttext,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyprofilePage()),
            );
          },
          icon: Icon(Icons.person),
          style: IconButton.styleFrom(iconSize: 35),
          color: AppColors.hinttext,
        ),
      ],
    );
  }
}
