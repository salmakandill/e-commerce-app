import 'package:e_commerce_app/screens/products_page.dart';
import 'package:e_commerce_app/widgets/custom_profilecards.dart';
import 'package:flutter/material.dart';

class MyprofilePage extends StatelessWidget {
  const MyprofilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 30),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => ProductsPage()),
            );
          },
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.settings, size: 30), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  //image
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/taylorswift.jfif',
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(width: 20),
                  //name and email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Taylor Swift',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'taylorswift@gmail.com',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 171, 168, 168),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3592E7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 70),
              //favorites
              CustomCard(title: 'Favorites', icon: Icons.favorite_border),
              SizedBox(height: 20),
              //download
              CustomCard(title: 'Downloads', icon: Icons.download),
              SizedBox(height: 20),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              SizedBox(height: 15),
              //language
              CustomCard(title: 'Language', icon: Icons.language),
              //location
              SizedBox(height: 15),
              CustomCard(title: 'Location', icon: Icons.location_on_sharp),
              SizedBox(height: 20),
              Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              //clear cache
              CustomCard(title: 'Clear Cache', icon: Icons.delete_sweep),
              SizedBox(height: 15),
              //clear history
              CustomCard(
                title: 'Clear History',
                icon: Icons.access_time_rounded,
              ),

              SizedBox(height: 15),
              //log out
              CustomCard(title: 'Logout', icon: Icons.logout_sharp),
              SizedBox(height: 20),
              Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ButtomNavigationBarIcons(),
    );
  }
}
