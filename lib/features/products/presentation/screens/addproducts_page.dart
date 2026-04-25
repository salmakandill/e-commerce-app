import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/features/products/presentation/screens/products_page.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_labeled_textfield.dart';
import 'package:flutter/material.dart';

class AddproductsPage extends StatefulWidget {
  const AddproductsPage({super.key});

  @override
  State<AddproductsPage> createState() => _AddproductsPageState();
}

class _AddproductsPageState extends State<AddproductsPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  Dio dio = Dio();
  Future<void> addproduct() async {
    try {
      final response = await dio.post(
        'https://api.escuelajs.co/api/v1/products/',
        data: {
          "title": titleController.text,
          "price": priceController.text,
          "description": descriptionController.text,
          "categoryId": 2,
          "images": ["https://m.media-amazon.com/images/I/41m1xMyv58L._AC_SY741_.jpg"],
        },
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Product added Successfly')));
    } on DioException catch (e) {
      log('Error Dio: ${e.response?.data['message']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ButtomNavigationBarIcons(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductsPage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Add Products',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomLabeledTextfield(
                title: 'Title',
                controller: titleController,
              ),
              SizedBox(height: 20),
              CustomLabeledTextfield(
                title: 'Description',
                controller: descriptionController,
                maxline: 5,
                hinttext: 'Add Description',
              ),
              SizedBox(height: 20),
              CustomLabeledTextfield(
                title: 'Price',
                controller: priceController,
              ),
              SizedBox(height: 20),
              CustomButton(title: 'Add Product', onPressed: () {
                      addproduct();
                      log('Title:${titleController.text}');
                      log('Description:${descriptionController.text}');
                      log('image:${imageController.text}');
                      log('price:${priceController.text}');
                      log('id:${idController.text}');
                    },)

            ],
          ),
        ),
      ),
    );
  }
}
