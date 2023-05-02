import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/datta/wishlist_item.dart';
import 'package:e_commerce_app_ui/features/home/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<ProductWishlistFetchEvent>(productWishlistFetch);
    on<ProductWishlistDeleteEvent>(productWishlistDelete);
  }

  FutureOr<void> productWishlistDelete(
      ProductWishlistDeleteEvent event, Emitter<WishlistState> emit) {
    wishlistProductList.remove(event.wihslistProduct);
    emit(WishlistLoading());
    emit(WishlistLoaded(wishlistProducts: wishlistProductList));
  }
}

FutureOr<void> productWishlistFetch(
    ProductWishlistFetchEvent event, Emitter<WishlistState> emit) async {
  emit(WishlistLoading());
  await Future.delayed(const Duration(seconds: 3));
  emit(WishlistLoaded(wishlistProducts: event.wihslistProducts));
}
