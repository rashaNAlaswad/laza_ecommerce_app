part of 'categories_cubit.dart';

sealed class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<Category> categories;
  const CategoriesSuccess(this.categories);
}

class CategoriesFailure extends CategoriesState {
  final ApiErrorModel error;
  const CategoriesFailure(this.error);
}
