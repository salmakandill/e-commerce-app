import 'package:e_commerce_app/features/products/presentation/screens/addproducts_page.dart';
import 'package:e_commerce_app/features/products/presentation/screens/homepage.dart';
import 'package:e_commerce_app/features/products/presentation/screens/searchpage.dart';
import 'package:e_commerce_app/features/profile/presentation/screens/myprofile_page.dart';
import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class ButtomNavigationBar extends StatefulWidget {
  const ButtomNavigationBar({super.key});

  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarIconsState();
}

class _ButtomNavigationBarIconsState extends State<ButtomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            activeForegroundColor: AppColors.buttonColor,
            icon: Icon(Icons.home),
            iconSize: 40,
          ),
        ),
        PersistentTabConfig(
          screen: SearchPage(),
          item: ItemConfig(
            activeForegroundColor: AppColors.buttonColor,
            icon: Icon(Icons.search),
            iconSize: 40,
          ),
        ),
        PersistentTabConfig(
          screen: AddproductsPage(),
          item: ItemConfig(
            activeForegroundColor: AppColors.buttonColor,
            icon: Icon(Icons.shopping_bag),
            iconSize: 40,
          ),
        ),
        PersistentTabConfig(
          screen: MyprofilePage(),
          item: ItemConfig(
            activeForegroundColor: AppColors.buttonColor,
            icon: Icon(Icons.person),
            iconSize: 40,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style10BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
// Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       spacing: 10,
//       children: [
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           },
//           icon: Icon(Icons.home),
//           style: IconButton.styleFrom(iconSize: 35),
//           color: AppColors.hinttext,
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SearchPage()),
//             );
//           },
//           icon: Icon(Icons.search),
//           style: IconButton.styleFrom(iconSize: 35),
//           color: AppColors.hinttext,
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AddproductsPage()),
//             );
//           },
//           icon: Icon(Icons.shopping_bag),
//           style: IconButton.styleFrom(iconSize: 35),
//           color: AppColors.hinttext,
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyprofilePage()),
//             );
//           },
//           icon: Icon(Icons.person),
//           style: IconButton.styleFrom(iconSize: 35),
//           color: AppColors.hinttext,
//         ),
//       ],
//     );