import 'package:flutter/material.dart';

class LoadImgByLocAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoadImgByLocAppPageState();
  }
}

class _LoadImgByLocAppPageState extends State<LoadImgByLocAppPage> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('_LoadImgByLocAppPageState');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Image.asset('images/ic_assignment_ind_36pt.png'),
          new Divider(),
          new Image(
            image: new AssetImage('images/ic_assignment_ind_36pt.png'),
          ),
          new Divider(),
        ],
      ),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}

class LoadImgByLocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new LoadImgByLocAppPage(),
    );
  }
}
