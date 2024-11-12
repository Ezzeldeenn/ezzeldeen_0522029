class ProduModel {
  final int id;
  final String image;
  final String category;
  final String name;
  final int price;
  final String product;

  ProduModel({
    required this.id,
    required this.image,
    required this.price,
    required this.category,
    required this.product,
    required this.name,
  });

  factory ProduModel.fromJson(Map<String, dynamic> json) {
    return ProduModel(
      id: json['id'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      product: json['product'],
      name: json['name'],
    );
  }
}
