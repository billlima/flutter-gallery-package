library galleryimage;

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import './gallery_Item_model.dart';
import './gallery_Item_thumbnail.dart';
import './gallery_image_view_wrapper.dart';
import './util.dart';

class GalleryImage extends StatefulWidget {
  final List<GalleryItemModel> images;
  final String? titileGallery;

  const GalleryImage({
    required this.images, 
    this.titileGallery
  });
  @override
  _GalleryImageState createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  List<GalleryItemModel> galleryItems = <GalleryItemModel>[];
  @override
  void initState() {
    galleryItems = widget.images.mapIndexed((idx, element) {
      if (element.id == null) {
        element.id = "${element.imageUrl}-${new Random().nextDouble()}";
      }
      return element;
    }).toList();
    
    super.initState();
  }

  Widget build(BuildContext context) {
    switch (galleryItems.length) {
      case 0:
        return getEmptyWidget();
      case 1:
        return GalleryItemThumbnail(
          galleryItem: galleryItems[0],
          onTap: () {
            openImageFullScreen(0);
          },
        );
      case 2:
      case 3:
        return buildOneLineGrid();
      default:
        return buildFourOrMore();
    }
  }

  Widget buildFourOrMore() {
    var otherImages = [];

    // We want to skip the index zero
    for (var i = 1; i < galleryItems.length; i++) {
      otherImages.add(galleryItems[i]);
    }

    return Container(
      child: Column(
        children: [
          GalleryItemThumbnail(
            galleryItem: galleryItems[0],
            onTap: () {
              openImageFullScreen(0);
            },
            height: 160.0,
            width: double.maxFinite,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: GridView.builder(
                primary: false,
                itemCount: 3,
                padding: EdgeInsets.all(0),
                semanticChildCount: 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 5),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var itemRealIndex = galleryItems.indexOf(otherImages[index]);

                  return ClipRRect(
                      // borderRadius: BorderRadius.all(Radius.circular(8)),
                      // if have less than 4 image w build GalleryItemThumbnail
                      // if have mor than 4 build image number 3 with number for other images
                      child: otherImages.length > 3 && index == 2
                          ? buildImageNumbers(itemRealIndex)
                          : GalleryItemThumbnail(
                              galleryItem: otherImages[index],
                              onTap: () {
                                openImageFullScreen(itemRealIndex);
                              },
                            ));
                }),
          ),
        ],
      ),
    );
  }

  Widget buildOneLineGrid() {
    return Container(
      child: GridView.builder(
          primary: false,
          itemCount: galleryItems.length,
          padding: EdgeInsets.all(0),
          semanticChildCount: 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: galleryItems.length,
              mainAxisSpacing: 0,
              crossAxisSpacing: 5),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return galleryItems.length > 3 && index == 2
                ? buildImageNumbers(index)
                : GalleryItemThumbnail(
                    galleryItem: galleryItems[index],
                    onTap: () {
                      openImageFullScreen(index);
                    },
                  );
          }),
    );
  }

// build image with number for other images
  Widget buildImageNumbers(int index) {
    return GestureDetector(
      onTap: () {
        openImageFullScreen(index);
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: <Widget>[
          GalleryItemThumbnail(
            galleryItem: galleryItems[index],
          ),
          Container(
            color: Colors.black.withOpacity(.7),
            child: Center(
              child: Text(
                "+${galleryItems.length - index}",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }

// to open gallery image in full screen
  void openImageFullScreen(final int indexOfImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryImageViewWrapper(
          titileGallery: widget.titileGallery,
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: indexOfImage,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
