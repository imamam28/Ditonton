import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosterImage extends StatelessWidget {
  final String imagePath;
  final String? label;
  final VoidCallback? action;
  final double height;
  const PosterImage({
    Key? key,
    required this.imagePath,
    this.label,
    this.action,
    this.height = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: SizedBox(
        width: 2 / 3 * height,
        height: height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  width: 2 / 3 * height,
                  height: height,
                  imageUrl: imagePath,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.white,
                      child: Container(
                        width: 2 / 3 * height,
                        height: height,
                        color: Colors.black,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Container(
                      width: 2 / 3 * height,
                      height: height,
                      color: Colors.grey.shade400,
                      child: const Center(child: Icon(Icons.error)),
                    );
                  },
                ),
              ),
            ),
            if (label != null)
              Positioned(
                bottom: 0,
                child: Container(
                  width: 2 / 3 * height,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Text(
                    label!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(height: 1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
