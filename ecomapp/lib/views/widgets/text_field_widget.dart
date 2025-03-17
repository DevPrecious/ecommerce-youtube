import 'package:ecomapp/const/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.text,
    this.isPassword = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final String text;
  final bool? isPassword;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword!,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: hintText,
            suffixIcon: isPassword! ? suffixIcon : null,
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: textFieldColor,
            filled: true,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
