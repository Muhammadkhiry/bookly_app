import 'package:bookly_app/features/home/presentation/views/widgets/custom_bookImage_loading_skeleton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const new({super.key, required this.imageURL});
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.487,
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: Padding(
          padding: const EdgeInsets.only(right: 9.0),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: CachedNetworkImage(
                imageUrl: imageURL,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const CustomBookImageLoadingSkeleton(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
