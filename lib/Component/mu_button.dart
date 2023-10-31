import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({required this.onTap, required this.text, super.key});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
