import 'package:collection/collection.dart';

class Product {
  String? id;
  String? name;
  dynamic description;
  String? stockStatus;
  dynamic manufacturer;
  String? quantity;
  dynamic reviews;
  String? price;
  String? thumb;
  bool? special;
  int? rating;

  Product({
    this.id,
    this.name,
    this.description,
    this.stockStatus,
    this.manufacturer,
    this.quantity,
    this.reviews,
    this.price,
    this.thumb,
    this.special,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as dynamic,
        stockStatus: json['stock_status'] as String?,
        manufacturer: json['manufacturer'] as dynamic,
        quantity: json['quantity'] as String?,
        reviews: json['reviews'] as dynamic,
        price: json['price'] as String?,
        thumb: json['thumb'] as String?,
        special: json['special'] as bool?,
        rating: json['rating'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'stock_status': stockStatus,
        'manufacturer': manufacturer,
        'quantity': quantity,
        'reviews': reviews,
        'price': price,
        'thumb': thumb,
        'special': special,
        'rating': rating,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Product) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      stockStatus.hashCode ^
      manufacturer.hashCode ^
      quantity.hashCode ^
      reviews.hashCode ^
      price.hashCode ^
      thumb.hashCode ^
      special.hashCode ^
      rating.hashCode;
}
