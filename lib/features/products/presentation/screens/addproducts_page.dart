import 'dart:developer';
import 'package:e_commerce_app/features/products/presentation/screens/products_page.dart';
import 'package:e_commerce_app/widgets/app_colors.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_labeled_textfield.dart';
import 'package:e_commerce_app/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class AddproductsPage extends StatefulWidget {
  AddproductsPage({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  State<AddproductsPage> createState() => _AddproductsPageState();
}

class _AddproductsPageState extends State<AddproductsPage> {
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
                controller: widget.titleController,
              ),
              SizedBox(height: 20),
              CustomLabeledTextfield(
                title: 'Description',
                controller: widget.descriptionController,
                maxline: 5,
                hinttext: 'Add Description',
              ),
              SizedBox(height: 20),
              CustomLabeledTextfield(
                title: 'Image',
                controller: widget.imageController,
                hinttext: 'Add Image',
              ),
              SizedBox(height: 20),
              CustomLabeledTextfield(
                title: 'Price',
                controller: widget.priceController,
              ),
              SizedBox(height: 20),
              CustomLabeledTextfield(
                title: 'ID',
                controller: widget.idController,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      log('Title:${widget.titleController.text}');
                      log('Title:${widget.descriptionController.text}');
                      log('Title:${widget.imageController.text}');
                      log('Title:${widget.priceController.text}');
                      log('Title:${widget.idController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: TextStyles(
                      text: 'Submit',
                      fontSize: 17,
                      appColor: AppColors.whitecolor,
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      backgroundColor: AppColors.aredshade,
                    ),
                    child: TextStyles(
                      text: 'Delete',
                      fontSize: 17,
                      appColor: AppColors.whitecolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
