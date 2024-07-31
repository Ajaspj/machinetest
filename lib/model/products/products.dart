import 'package:collection/collection.dart';

import 'product.dart';

class Products {
  bool? success;
  List<Product>? products;

  Products({this.success, this.products});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        success: json['success'] as bool?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  get thumb => null;

  String? get name => null;

  get price => null;

  get description => null;

  Map<String, dynamic> toJson() => {
        'success': success,
        'products': products?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Products) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ products.hashCode;
}
