import 'package:e_commerce_app/api/server.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/custom_productcard.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';

class CustomHorizontalList extends StatefulWidget {
  final String title;
  const CustomHorizontalList({super.key, required this.title});

  @override
  State<CustomHorizontalList> createState() => _CustomHorizontalListState();
}

class _CustomHorizontalListState extends State<CustomHorizontalList> {
  List<ProductsModel> products = [];
  final ApiServer apiService = ApiServer();

  Future<void> callingapi() async {
    products = await apiService.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callingapi();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextButton(onPressed: () {}, child: Text('See all')),
          ],
        ),

        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return SizedBox(
                width: 160,
                child: CustomProductcard(productsmodel: product),
              );
            },
          ),
        ),
      ],
    );
  }
}
