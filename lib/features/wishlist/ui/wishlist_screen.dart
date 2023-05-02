import 'package:e_commerce_app_ui/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlistted items')),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistLoading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case WishlistLoaded:
              var data = state as WishlistLoaded;

              return ListView.builder(
                  itemCount: state.wishlistProducts.length,
                  itemBuilder: (context, index) {
                    Product product = data.wishlistProducts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: product.color,
                        backgroundImage: AssetImage(product.image.toString()),
                      ),
                      title: Text(product.title),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<WishlistBloc>().add(
                              ProductWishlistDeleteEvent(
                                  wihslistProduct: product));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  });
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
