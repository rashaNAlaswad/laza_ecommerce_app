import 'package:json_annotation/json_annotation.dart';

part 'prodect_detailes_response.g.dart';

@JsonSerializable()
class ProductDetailesResponse {
  final String id;
  final String productCode;
  final String name;
  final String description;
  final String nameArabic;
  final String descriptionArabic;
  final String coverPictureUrl;
  final List<String> productPictures;
  final List<String> categories;
  final double price;
  final int stock;
  final double weight;
  final String color;
  final double discountPercentage;
  final double rating;
  final int reviewsCount;
  final String sellerId;

  ProductDetailesResponse({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.nameArabic,
    required this.descriptionArabic,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.categories,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.discountPercentage,
    required this.rating,
    required this.reviewsCount,
    required this.sellerId,
  });

  factory ProductDetailesResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailesResponseToJson(this);
}
