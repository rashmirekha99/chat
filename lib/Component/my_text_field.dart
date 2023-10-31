import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
      {required this.controller,
      required this.hintText,
      required this.obsureText,
      super.key});
  final TextEditingController controller;
  final String hintText;
  final bool obsureText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obsureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          fillColor: Colors.grey,
          filled: true,
          hintText: widget.hintText),
    );
  }
}
