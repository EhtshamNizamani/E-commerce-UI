// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<CartModel> cartModel;
  CartSuccessState({
    required this.cartModel,
  });
}
