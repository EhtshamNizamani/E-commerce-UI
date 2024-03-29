// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app_ui/features/home/bloc/home_bloc.dart';
import 'package:e_commerce_app_ui/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_ui/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/cart_item_count.dart';
import 'home_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({required this.product, Key? key})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: AppBar(
          backgroundColor: widget.product.color,
          elevation: 0,
          actions: myAppBar(context, Colors.white70)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    height: size.height,
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, bottom: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Text(
                          'Office Code',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            height: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '\$${widget.product.price.toString()}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                                Hero(
                                  tag: widget.product.id,
                                  child: Image(
                                    image: AssetImage(widget.product.image),
                                    width: 250,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            )),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(width: 2),
                            Text('Color'),
                            SizedBox(
                              width: 210,
                            ),
                            Text('Size'),
                          ],
                        ),
                        Row(
                          children: [
                            ColorDot(
                              isSelected: true,
                              borderColor: const Color(0XFF356C95),
                            ),
                            ColorDot(
                              borderColor: const Color(0xFFD3A984),
                            ),
                            ColorDot(
                              borderColor: const Color(0xFFFB7883),
                            ),
                            const SizedBox(width: 157),
                            Text('${widget.product.size.toString()}cm')
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Sed ut perspiciatis unde omnis iste natus error sit voluptatemunde omnis iste natus error sit voluptatem unde omnis iste natus error sit voluptatem  unde omnis iste natus error sit voluptatem unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto',
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CartItemCount(),
                            InkWell(
                              onTap: () {
                                context.read<HomeBloc>().add(
                                    HomeProductWishlistButtonClickedEvent(
                                        product: widget.product));
                              },
                              child: SvgPicture.asset(
                                'assets/icons/heart.svg',
                                color: Colors.redAccent,
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 58,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: widget.product.color),
                                    borderRadius: BorderRadius.circular(18)),
                                child: IconButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                        HomeProductCartButtonClickedEvent(
                                            product: widget.product));
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/add_to_cart.svg',
                                    color: widget.product.color,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        backgroundColor: widget
                                            .product.color // Background color
                                        ),
                                    onPressed: () {},
                                    child: const Text('Buy Now'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ColorDot extends StatelessWidget {
  ColorDot({
    Key? key,
    required this.borderColor,
    this.isSelected = false,
  }) : super(key: key);

  final Color borderColor;
  bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            top: kDefaultPaddin / 2, left: kDefaultPaddin / 4),
        padding: const EdgeInsets.all(2.5),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: isSelected!
              ? Border.all(width: 1, color: const Color(0XFF356C95))
              : null,
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(color: borderColor, shape: BoxShape.circle),
        ));
  }
}
