import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/datta/cart_item.dart';
import 'package:e_commerce_app_ui/datta/wishlist_item.dart';
import 'package:equatable/equatable.dart';

import '../../../datta/product_list.dart';
import '../model/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitial);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClicked);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClicked);
  }
}

FutureOr<void> homeProductCartButtonClicked(
    HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
  cartItemList.add(event.product);
  emit(HomeProductCartButtonClickedState());
}

FutureOr<void> homeProductWishlistButtonClicked(
    HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
  wishlistProductList.add(event.product);
  emit(HomeProductWishlistButtonClickedState());
}

Future<void> homeInitial(
    HomeInitialEvent event, Emitter<HomeState> emit) async {
  emit(HomeLoadingState());

  await Future.delayed(const Duration(seconds: 3));
  emit(
    HomeLoadedSuccessState(
      productList: products
          .map(
            (e) => Product(
                image: e['image'],
                id: e['id'],
                title: e['title'],
                price: e['price'],
                description: e['description'],
                size: e['size'],
                color: e['color'],
                isFavorite: e['isFavorite']),
          )
          .toList(),
    ),
  );
}
