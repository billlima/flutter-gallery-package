import 'package:flutter/material.dart';
import 'package:galleryimage/gallery_Item_model.dart';
import 'package:galleryimage/galleryimage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery Image Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Gallery Image Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;

  const MyHomePage({Key key, this.title}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tap to show image"),
            GalleryImage(
              images: [
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
