// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState extends Equatable {}

class WishlistInitialState extends WishlistState {
  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {
  @override
  List<Object?> get props => [];
}

class WishlistLoaded extends WishlistState {
  final List<Product> wishlistProducts;
  WishlistLoaded({
    required this.wishlistProducts,
  });

  @override
  List<Object?> get props => [wishlistProducts];
}
