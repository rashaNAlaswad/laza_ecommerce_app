part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Category> categories;
  final List<Product> products;

  HomeSuccess({
    required this.categories,
    required this.products,
  });
}

class HomeFailure extends HomeState {
  final ApiErrorModel error;

  HomeFailure(this.error);
}

