import 'package:flutter/material.dart';

class CustomNewsItemBodyAnimation extends StatelessWidget {
  const CustomNewsItemBodyAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 20,
              color: Colors.grey.shade50,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: 50,
                  color: Colors.grey.shade50.withAlpha((0.6 * 255).round()),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 20,
                  width: 50,
                  color: Colors.grey.shade50.withAlpha((0.6 * 255).round()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
