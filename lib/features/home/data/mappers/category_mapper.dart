import '../../domain/entities/category.dart';
import '../models/category_response.dart';

class CategoryMapper {
  static Category toDomain(CategoryResponse categoryResponse) {
    return Category(
      id: categoryResponse.id,
      name: categoryResponse.name,
      coverPictureUrl: categoryResponse.coverPictureUrl,
    );
  }

  static List<Category> toDomainList(List<CategoryResponse> categoryResponses) {
    return categoryResponses.map((response) => toDomain(response)).toList();
  }
}
