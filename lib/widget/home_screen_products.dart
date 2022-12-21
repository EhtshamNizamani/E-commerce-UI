import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/model/product_model.dart';
import 'package:e_commerce_app_ui/screens/details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenProducts extends StatelessWidget {
  const HomeScreenProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.70, crossAxisSpacing: 20),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      productName: products[index].title,
                      price: products[index].price,
                      color: products[index].color,
                      image: products[index].image,
                      productId: products[index].id,
                      size: products[index].size,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.22,
                    decoration: BoxDecoration(
                        color: products[index].color,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Hero(
                        tag: products[index].id,
                        child: Image(
                          image: AssetImage(products[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    products[index].title,
                    style: const TextStyle(color: kTextLightColor),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${products[index].price}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          }),
    );
  }
}
