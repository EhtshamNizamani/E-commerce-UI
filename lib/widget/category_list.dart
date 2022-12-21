import 'package:e_commerce_app_ui/constants.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;

  final List<String> ListCategories = [
    'Hand Beg',
    'Jewellery',
    'FootWear',
    'Dresses',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.060,
      width: size.width * size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ListCategories.length,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(right: size.width * 0.105, bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          ListCategories[index],
                          style: TextStyle(
                              color: index == selectedIndex
                                  ? kTextColor
                                  : kTextLightColor),
                        ),
                      ),
                    ),
                  ],
                ),
                index == selectedIndex
                    ? Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 10),
                        child: Container(
                          width: 30,
                          height: 4,
                          decoration: BoxDecoration(
                              color: kTextColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(4)),
                        ))
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
