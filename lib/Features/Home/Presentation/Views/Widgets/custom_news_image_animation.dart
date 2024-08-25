import 'package:flutter/material.dart';

class CustomNewsImageAnimation extends StatelessWidget {
  const CustomNewsImageAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: AspectRatio(
        aspectRatio: 1,
          child: Container(
        color: Colors.grey.shade50,
      )),
    );
  }
}
