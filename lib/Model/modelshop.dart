// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Modelshop {
  int id ; 
  String title;
  num price;
  String image;
  int count;
  double rating;
  Modelshop({
    required this.rating,
    required this.count,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
  factory Modelshop.fromMap(Map<String, dynamic> map) {
    return Modelshop(
      count:map['rating']? ['count'] ?? 0 ,
      rating: (map['rating']? ['rate'] ?? 0.0).toDouble() ,
      id :map['id'] as  int,
      title: map['title'] as String,
      price: map['price'] as num,
      image: map['image'] ?? 'not loaded',
    );
  }

  factory Modelshop.fromJson(String source) => Modelshop.fromMap(json.decode(source) as Map<String, dynamic>);
}
