// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class HomeInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final Product product;
  HomeProductWishlistButtonClickedEvent({
    required this.product,
  });
  @override
  List<Object?> get props => [];
}

// class UpdateProuctEvent extends HomeEvent {
//   final Product productUpdated;
//   UpdateProuctEvent({
//     required this.productUpdated,
//   });

//   @override
//   List<Object?> get props => [productUpdated];
// }

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final Product product;
  HomeProductCartButtonClickedEvent({
    required this.product,
  });

  @override
  List<Object?> get props => [];
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeCartButtonNavigateEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
