import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  CategoryResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
