class Categorymodel {
  final int? id;
  final String name, image;
  final String? slug;

  Categorymodel({this.id, required this.name, required this.image, this.slug});
  factory Categorymodel.getfromjson(Map<String, dynamic> json) {
    return Categorymodel(
      name: json['name'],
      image: json['image'],
      id: json['id'],
      slug: json['slug'],
    );
  }
}
