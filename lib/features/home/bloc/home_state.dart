// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<Product> productList;
  HomeLoadedSuccessState({
    required this.productList,
  });
}

class HomeErrorMessageState extends HomeState {
  final String errorMessage;
  HomeErrorMessageState({
    required this.errorMessage,
  });
}

class HomeNavigateToProductDetailsPageState extends HomeActionState {}

class HomeNavigateToCartPageState extends HomeActionState {}

class HomeProductCartButtonClickedState extends HomeActionState {}

class HomeProductWishlistButtonClickedState extends HomeActionState {}
