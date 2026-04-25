class ProductsModel {
  final String imageurl, title, description;
  final int price,id;
  const ProductsModel({
    required this.imageurl,
    required this.title,
    required this.price,
    required this.description, required this.id,
  });
  factory ProductsModel.getfromjson(Map<String, dynamic> json) {
    return ProductsModel(
      id:json['id'],
      imageurl: json['category']['image'],
      title: json['title'],
      price: json['price'],
      description: json["description"],
    );
  }
}
