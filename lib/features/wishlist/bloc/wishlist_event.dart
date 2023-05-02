// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent extends Equatable {}

class WishlistInitialEvent extends WishlistEvent {
  @override
  List<Object?> get props => [];
}

class ProductWishlistFetchEvent extends WishlistEvent {
  final List<Product> wihslistProducts;
  ProductWishlistFetchEvent({
    required this.wihslistProducts,
  });

  @override
  List<Object?> get props => [wihslistProducts];
}

class ProductWishlistDeleteEvent extends WishlistEvent {
  final Product wihslistProduct;
  ProductWishlistDeleteEvent({
    required this.wihslistProduct,
  });

  @override
  List<Object?> get props => [wihslistProduct];
}
