// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Product {
  final String image;
  final String title;
  final String description;
  final int price;
  final int size;
  final int id;
  final Color color;
  bool isFavorite;
  Product({
    required this.image,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    this.isFavorite = false,
  });
}
