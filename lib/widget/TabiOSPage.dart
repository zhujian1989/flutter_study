import 'package:flutter/material.dart';
import 'package:flutter_study/widget/CommonItem.dart';
class IOSAppPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _IOSAppPageState();
  }

}

class _IOSAppPageState extends State<IOSAppPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body:  new ListView.builder(
            itemCount: 10,
            itemBuilder: buildCommonItem,

        ),
    );
  }
}



class TabiOSPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new IOSAppPage(),
    );
  }
}

