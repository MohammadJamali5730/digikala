class ModelSeemore {
  final String title;
  final String image;
  final double price;
  final String description;

  ModelSeemore({
    required this.title,
    required this.image,
    required this.price,
    required this.description
  });

  Map<String, dynamic> toMap() {
    return {
      'description':description,
      'title': title,
      'image': image,
      'price': price,
    };
  }

  factory ModelSeemore.fromMap(Map<String, dynamic> map) {
    return ModelSeemore(
      description: map['description']??'',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }
}
