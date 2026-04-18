class ProductsModel {
  final String imageurl, title, price;
  const ProductsModel({
    required this.imageurl,
    required this.title,
    required this.price,
  });
  factory ProductsModel.getfromjson(Map<String, dynamic> json) {
    return ProductsModel(
      imageurl: json['category']['image'],
      title: json['title'],
      price: json['price'].toString(),
    );
  }
}
