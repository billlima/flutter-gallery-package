# Gallery Image plugin for Flutter

A Flutter plugin that list of images from URLs 


<h1 align="center">
  Gallery Image
  <br>
</h1>

<h4 align="center">
  <a href="https://flutter.dev" target="_blank">Flutter</a> plugin that allows you to display multi image on iOS and Android.
</h4>

<p align="center">
  <a href="https://pub.dartlang.org/packages/galleryimage">
    <img src="https://img.shields.io/badge/build-passing-green"
         alt="Build">
  </a>
  <a href="https://pub.dartlang.org/packages/galleryimage"><img src="https://img.shields.io/badge/pub-v1.0.0-blue"></a>
  
</p>

<p align="center">
  <a href="#Installation">Installation</a> •
  <a href="#related">Related</a> •
  <a href="#license">License</a> 
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/BeshoyMelika/flutter-gallery-package/master/images/example.gif" alt="Gallery Image" width="300" height="600" />
</p>


## Key Features
* Pick images from Url
* Photos sorted 
* zoomable image

## Installation

Add `galleryimage` as a dependency in your pubspec.yaml file .

Import Photo View:
```dart
import 'package:galleryimage/galleryimage.dart';
```

### Usage

#### Listing URLs Images
``` dart
List<GalleryItemModel> images = [
  GalleryItemModel(
    imageUrl: "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    imageUrlSmall: "https://content.solsea.io/files/thumbnail/1639497931091-499911050.jpg",
    description: 'With thumbnail'
  ),
  GalleryItemModel(
    imageUrl: "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    imageUrlSmall: "https://w7.pngwing.com/pngs/653/745/png-transparent-green-trees-under-cloudy-sky-illustration-natural-landscape-euclidean-nature-landscape-element-leaf-branch-landscape-thumbnail.png",
    description: 'With thumbnail'
  ),
  GalleryItemModel(imageUrl: "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg"),
  GalleryItemModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg"),
  GalleryItemModel(imageUrl: "https://ebm.com.br/wp-content/uploads/2021/03/integracao-com-natureza.jpg"),
  GalleryItemModel(imageUrl: "https://blog.serraimperial.com/wp-content/uploads/2019/11/O-que-%C3%A9-Ecoturismo-e-como-aproveitar-um-dia-em-meio-a-Natureza.jpg"),
];
```


#### To Displaying Images

```dart
@override
Widget build(BuildContext context) {
  return Container(
    child: GalleryImage(
     images: images,
    )
  );
}
```


## Emailware

Gallery Image is an [emailware](https://en.wiktionary.org/wiki/emailware). Meaning, if you liked using this plugin or has helped you in anyway, I'd like you send me an email on <BeshoyMelika@gmail.com> about anything you'd want to say about this software. I'd really appreciate it!

## Related

[photo_view](https://pub.dartlang.org/packages/photo_view) - A simple zoomable image/content widget for Flutter.
[cached_network_image](https://pub.dartlang.org/packages/cached_network_image) - To Load and cache network images..

You can build a gallery Images easily with this package.

See the [example](example) for more details.

## License

MIT