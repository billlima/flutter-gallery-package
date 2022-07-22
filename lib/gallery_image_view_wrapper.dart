import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import './gallery_Item_model.dart';

// to view image in full screen
class GalleryImageViewWrapper extends StatefulWidget {
  final List<GalleryItemModel> galleryItems;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final int initialIndex;
  final PageController? pageController;
  final Axis scrollDirection;
  final String? titileGallery;

  GalleryImageViewWrapper({
    required this.galleryItems,
    this.loadingBuilder,
    this.titileGallery,
    this.backgroundDecoration,
    required this.initialIndex,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  @override
  State<StatefulWidget> createState() {
    return _GalleryImageViewWrapperState();
  }
}

class _GalleryImageViewWrapperState extends State<GalleryImageViewWrapper> {
  int? currentIndex;
  var currentDescription;
  final minScale = PhotoViewComputedScale.contained * 0.8;
  final maxScale = PhotoViewComputedScale.covered * 8;

  @override
  void initState() {
    super.initState();

    currentDescription = widget.galleryItems[widget.initialIndex].description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: widget.backgroundDecoration,
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height,
                ),
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildImage,
                  itemCount: widget.galleryItems.length,
                  loadingBuilder: widget.loadingBuilder,
                  backgroundDecoration: widget.backgroundDecoration,
                  pageController: widget.pageController,
                  scrollDirection: widget.scrollDirection,
                  onPageChanged: (index) {
                    setState(() {
                      currentDescription =
                          widget.galleryItems[index].description;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
                child: Text(
                  currentDescription ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: kToolbarHeight * 0.5),
            child: IconButton(
                icon: Icon(
                    Platform.isAndroid
                        ? Icons.arrow_back
                        : Icons.arrow_back_ios,
                    color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

// build image with zooming
  PhotoViewGalleryPageOptions _buildImage(BuildContext context, int index) {
    final GalleryItemModel item = widget.galleryItems[index];

    return PhotoViewGalleryPageOptions.customChild(
      child: Container(
        child: CachedNetworkImage(
          imageUrl: item.imageUrl,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: minScale,
      maxScale: maxScale,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id!),
    );
  }
}
