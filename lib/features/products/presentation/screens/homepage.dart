import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/custom_horizontal_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/images/taylorswift.jfif',
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello !',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Taylor Swift',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications, size: 35),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //Search
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Color(0xFF5F5D5D),
                        size: 35,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Search here',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.iconscolor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              "Get Winter Discount",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "20% Off",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "For Children",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomHorizontalList(title: 'Featured'),
                SizedBox(height: 20),
                CustomHorizontalList(title: 'Most Popular'),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: ButtomNavigationBarIcons(),
    );
  }
}
