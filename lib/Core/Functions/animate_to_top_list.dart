
import 'package:flutter/material.dart';
import 'package:news_app/Core/Functions/exit_app_dialog.dart';

void animatedtoTopofList(
    {required ScrollController scrollController,
    required BuildContext context}) {
  if (scrollController.offset > 0) {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 800), curve: Curves.bounceInOut);
  } else {
    exitAppDialog(context).show();
  }
}

