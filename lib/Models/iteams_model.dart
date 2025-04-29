class Items {
  final String name;
  final String imageUrl;
  final String description;
  final String price;
  final String productId;
  Items({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.productId,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "description": description,
      "price": price,
      "productId": productId,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      productId: map['productId'] ?? '',
    );
  }
}
