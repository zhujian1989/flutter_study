import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
const String imgNormalUrl =
    'https://ww1.sinaimg.cn/large/0065oQSqly1fs02a9b0nvj30sg10vk4z.jpg';

const String imgGifUrl =
    'http://s1.dwstatic.com/group1/M00/B3/31/6b640ceb4277d3993abb7422d61dd288.gif';

const int loadNormalImg = 0;
const int loadGifImg = 1;
const int loadImgWithCache = 2;
const int loadImgWithFade = 3;

class LoadImgByNetAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoadImgByNetAppPageState();
  }
}

class _LoadImgByNetAppPageState extends State<LoadImgByNetAppPage>{
  int curLoadWay = loadNormalImg;

  String curImageUrl = imgNormalUrl;

  _loadNormalImg() {
    curLoadWay = loadNormalImg;
    curImageUrl = imgNormalUrl;
    setState(() {});
  }

  _loadGifImg() {
    curLoadWay = loadGifImg;
    curImageUrl = imgGifUrl;
    setState(() {});
  }

  _loadImgWithCache() {
    curLoadWay = loadImgWithCache;
    curImageUrl = imgNormalUrl;
    setState(() {});
  }

  _loadImgWithFade() {
    curLoadWay = loadImgWithFade;
    curImageUrl = imgNormalUrl;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('_LoadImgByNetAppPageState initState');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        key: new PageStorageKey(_LoadImgByNetAppPageState),
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                child: new Text('加载普通图片'), onPressed: _loadNormalImg),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                child: new Text('加载gif图片'), onPressed: _loadGifImg),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                child: new Text('加载缓存图片'), onPressed: _loadImgWithCache),
          ),
          new Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
            child: new RaisedButton(
                child: new Text('淡入动画加载图片'), onPressed: _loadImgWithFade),
          ),
          new ImageView(curImageUrl, curLoadWay),
        ],
      ),
    );
  }

}

class ImageView extends StatelessWidget {

  final String imgUrl;

  final int loadWay;

  ImageView(this.imgUrl, this.loadWay);

  @override
  Widget build(BuildContext context) {

    Widget widget = new Icon(Icons.error);

    switch (loadWay) {
      case loadNormalImg:
      case loadGifImg:
        widget = new Image.network(imgUrl);
        break;
      case loadImgWithCache:
        widget = new CachedNetworkImage(
          imageUrl: imgUrl,
          placeholder: new CircularProgressIndicator(),
          errorWidget: new Icon(Icons.error),
        );
        break;
      case loadImgWithFade:
        widget = new FadeInImage.memoryNetwork(
            placeholder: kTransparentImage, image: imgUrl);
        break;
    }

    return widget;
  }
}

class LoadImgByNetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new LoadImgByNetAppPage(),
    );
  }
}
