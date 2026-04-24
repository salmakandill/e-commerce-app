class ProductsModel {
  final String imageurl, title, description;
  final int price;
  const ProductsModel({
    required this.imageurl,
    required this.title,
    required this.price,
    required this.description,
  });
  factory ProductsModel.getfromjson(Map<String, dynamic> json) {
    return ProductsModel(
      imageurl: json['category']['image'],
      title: json['title'],
      price: json['price'],
      description: json["description"],
    );
  }
}
