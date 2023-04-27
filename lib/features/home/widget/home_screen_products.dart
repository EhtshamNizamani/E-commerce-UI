import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/features/home/model/product_model.dart';
import 'package:e_commerce_app_ui/features/home/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeScreenProducts extends StatelessWidget {
  const HomeScreenProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeProductCartButtonClickedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        }
        if (state is HomeProductWishlistButtonClickedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadedSuccessState) {}
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeErrorMessageState:
            return const Center(
              child: Text('Product not Fetched..!'),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 20),
                  itemCount: successState.productList.length,
                  itemBuilder: (context, index) {
                    Product product = successState.productList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.22,
                            decoration: BoxDecoration(
                                color: product.color,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Hero(
                                tag: product.id,
                                child: Image(
                                  image: AssetImage(product.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            product.title,
                            style: const TextStyle(color: kTextLightColor),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    );
                  }),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
