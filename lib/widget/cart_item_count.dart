import 'package:flutter/material.dart';

class CartItemCount extends StatefulWidget {
  const CartItemCount({Key? key}) : super(key: key);

  @override
  State<CartItemCount> createState() => _CartItemCountState();
}

class _CartItemCountState extends State<CartItemCount> {
  int numItem = 01;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutLineButton(
            press: () {
              setState(() {
                if (numItem > 1) numItem--;
              });
            },
            icon: Icons.remove),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            numItem.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        buildOutLineButton(
            press: () {
              setState(() {
                numItem++;
              });
            },
            icon: Icons.add),
      ],
    );
  }

  Container buildOutLineButton({press, icon}) {
    return Container(
      width: 40,
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(179, 204, 200, 200)),
      child: IconButton(
        padding: const EdgeInsets.all(2),
        icon: Icon(icon),
        onPressed: press,
      ),
    );
  }
}
