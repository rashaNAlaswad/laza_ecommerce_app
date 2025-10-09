class ProductDetailes {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
  final List<String> productPictures;
  final List<String> categories;
  final double price;
  final int stock;
  final double weight;
  final String color;
  final double rating;
  final int reviewsCount;

  ProductDetailes({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.categories,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
  });
}
