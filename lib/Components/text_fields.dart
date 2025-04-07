import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String inputText;
  final IconData iconData;

  const CustomInputField(
      {super.key, required this.inputText, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          hintText: inputText,
          prefixIcon: Icon(
            iconData,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
