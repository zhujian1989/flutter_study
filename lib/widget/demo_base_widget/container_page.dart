import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ContainerPageState();
  }
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Container"),
        centerTitle: true,
      ),
      body: new Container(
        child: new Center(
          child: Transform(
            transform: Matrix4.identity(),
            child: new Container(
              height: 200.0,
              width: 200.0,
              decoration: new BoxDecoration(
                //圆形渐变
                gradient: new RadialGradient(
                    colors: <Color>[Colors.blue, Colors.blue[100]]),
                //Container形状
//                borderRadius: BorderRadius.circular(100.0),
                //改变线的颜色
//                border: Border.all(color: Colors.black),
                //增加阴影
//                boxShadow: <BoxShadow>[
//                  BoxShadow(
//                    color: Colors.blue[100],
//                    offset: new Offset(0.0, 2.0),
//                    blurRadius: 5.0,
//                  )
//                ],
                //Container形状
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
