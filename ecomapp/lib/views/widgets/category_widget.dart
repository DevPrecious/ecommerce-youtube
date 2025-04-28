import 'package:ecomapp/const/colors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
      backgroundColor: isSelected ? primaryColor : Colors.white,
    );
  }
}
