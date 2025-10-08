import 'package:json_annotation/json_annotation.dart';
import 'category_response.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final List<CategoryResponse> categories;

  CategoriesResponse({required this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
