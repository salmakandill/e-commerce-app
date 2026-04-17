import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, color: Colors.black, size: 35),

        Text(title, style: TextStyle(color: Colors.black, fontSize: 20)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 30),
        ),
      ],
    );
  }
}
