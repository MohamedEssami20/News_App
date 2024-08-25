import 'package:flutter/material.dart';
import 'package:news_app/Core/Constant/app_style.dart';

void showErrorSnackbar(
    BuildContext context, String errorMessage, IconData? myIcon) {
  final snackBar = SnackBar(
    margin: const EdgeInsets.only(bottom: 20, right: 12, left: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: AspectRatio(
      aspectRatio: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(errorMessage,
              style: AppStyle.regular20(context).copyWith(color: Colors.white)),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Container(
                alignment: Alignment.center,
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    myIcon,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: const Color(0xff6F0060),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
