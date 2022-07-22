import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import './gallery_Item_model.dart';

// to show image in Row
class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail({
    Key? key,
    required this.galleryItem,
    this.width,
    this.height,
    this.fit,
    this.onTap
  })
    : super(key: key);

  final GalleryItemModel galleryItem;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryItem.id!,
          child: CachedNetworkImage(
            fit: fit != null ? fit : BoxFit.cover,
            imageUrl: galleryItem.imageUrlSmall ?? galleryItem.imageUrl,
            width: width,
            height: height,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
