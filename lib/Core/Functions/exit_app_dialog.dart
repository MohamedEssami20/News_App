import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Core/Constant/app_style.dart';

AwesomeDialog exitAppDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.scale,
    showCloseIcon: true,
    padding: const EdgeInsets.all(20),
    desc: "Do You want to exit from news app?",
    title: "Information!",
    titleTextStyle: AppStyle.regular20(context),
    descTextStyle: AppStyle.medium18(context),
    btnCancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff6F0069),
          maximumSize: const Size(90, 80),
          minimumSize: const Size(70, 60),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Cancel",
          style: AppStyle.semiBold20(context),
        )),
    btnOk: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff6F0069),
          maximumSize: const Size(90, 80),
          minimumSize: const Size(70, 60),
        ),
        onPressed: () {
          SystemNavigator.pop();
        },
        child: Text(
          "Ok",
          style: AppStyle.semiBold20(context),
        )),
  );
}