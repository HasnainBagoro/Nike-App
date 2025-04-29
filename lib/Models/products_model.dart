class Products {
  final String id;
  final String name;
  final String imageUrl;
  final String descritpion;
  final String price;

  Products({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.descritpion,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'descritpion': descritpion,
      'price': price,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      descritpion: map['descritpion'] ?? '',
      price: map['price'] ?? '',
    );
  }
}
