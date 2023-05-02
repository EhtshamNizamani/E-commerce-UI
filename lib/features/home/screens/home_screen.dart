import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/features/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';

import '../widget/home_screen_products.dart';
import '../widget/category_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 249, 249),
        elevation: 0,
        actions: myAppBar(context, kTextLightColor),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Women',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: size.height * 0.02),
            // ignore: prefer_const_constructors
            CategoryList(),
            const HomeScreenProducts(),
          ],
        ),
      ),
    );
  }
}

List<IconButton> myAppBar(BuildContext context, color) {
  return [
    IconButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WishlistScreen()));
      },
      icon: Icon(
        Icons.favorite_border_outlined,
        color: color,
      ),
    ),
    IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart_checkout_outlined,
          color: color,
        ))
  ];
}
