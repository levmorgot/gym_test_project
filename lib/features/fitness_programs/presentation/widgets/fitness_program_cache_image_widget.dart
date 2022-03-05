import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FitnessProgramCacheImage extends StatelessWidget {
  final String url;

  const FitnessProgramCacheImage({Key? key, required this.url})
      : super(key: key);

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 170,
      height: 100,
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return _imageWidget(
            const AssetImage('assets/image/no_program_image.jpg'));
      },
    );
  }
}
