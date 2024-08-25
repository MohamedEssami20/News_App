import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/Widgets/custom_fading_widegt.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_image_animation.dart';

class CustomNewsImage extends StatelessWidget {
  const CustomNewsImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: AspectRatio(
        aspectRatio: 1,
        child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fadeInCurve: Curves.bounceOut,
            progressIndicatorBuilder: (context, url, progress) =>
                const CustomFadingWidget(child: CustomNewsImageAnimation())),
      ),
    );
  }
}
