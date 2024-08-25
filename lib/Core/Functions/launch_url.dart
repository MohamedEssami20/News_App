 import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchNewsUrl(
      {required BuildContext context, required String newsUrl}) async {
    final Uri uri = Uri.parse(newsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // ignore: use_build_context_synchronously
      showErrorSnackbar(context, "Can not launch this url, try later", Icons.error);
    }
  }