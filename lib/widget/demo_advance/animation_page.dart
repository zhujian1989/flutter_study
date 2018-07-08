import 'dart:async';
import 'dart:core';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimationPageState();
  }
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  int _aniIndex = 0;

  Widget _buildAnimation() {
    Widget widget;

    switch (_aniIndex) {
      case 0:
        widget = new OpacityAniWidget();
        break;
      case 1:
        widget = new MovementAniWidget();
        break;
      case 2:
        widget = new RadiusAniWidget();
        break;
      case 3:
        widget = new ColorAniWidget();
        break;
      case 4:
        widget = new RotateAniWidget();
        break;
      case 5:
        widget = new DeformAniWidget();
        break;
      case 6:
        widget = new StaggeredAniWidget();
        break;
    }

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Animation"),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('opacity'),
                    onPressed: () {
                      setState(() {
                        _aniIndex = 0;
                      });
                    }),
              ),
              new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('movement'),
                    onPressed: () {
                      setState(() {
                        _aniIndex = 1;
                      });
                    }),
              ),
              new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('radius'),
                    onPressed: () {
                      setState(() {
                        _aniIndex = 2;
                      });
                    }),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('color'),
                    onPressed: () {
                      setState(() {
                        _aniIndex = 3;
                      });
                    }),
              ),
              new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('rotate'),
                    onPressed: () {
                      setState(() {
                        _aniIndex = 4;
                      });
                    }),
              ),
              new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('deform'),
                    onPressed: () {
                      setState(() {
                        _aniIndex = 5;
                      });
                    }),
              ),
            ],
          ),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('Staggered'),
                    onPressed: () {
                      setState(() {
                        _aniIndex = 6;
                      });
                    }),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: _buildAnimation(),
          ),
        ],
      ),
    );
  }
}

class OpacityAniWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _OpacityAniWidgetState();
  }
}

class _OpacityAniWidgetState extends State<OpacityAniWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> opacity;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  void _initAni() {
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
  }

  Future _startAnimation() async {
    try {
      await _controller.repeat();
//
//      await _controller
//          .forward()
//          .orCancel;
//      await _controller
//          .reverse()
//          .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Opacity(
      opacity: opacity.value,
      child: new Container(
        color: Colors.red,
        height: 200.0,
        width: 200.0,
        child: new Center(
          child: new Text(
            'opacity',
            style: new TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

class MovementAniWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MovementAniWidgetState();
  }
}

class _MovementAniWidgetState extends State<MovementAniWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<EdgeInsets> movement;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 5000),
      vsync: this,
    );
  }

  void _initAni() {
    movement = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 0.0, right: 0.0),
      end: EdgeInsets.only(top: 50.0, right: 100.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.1,
          0.5,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
  }

  Future _startAnimation() async {
    try {
      await _controller.repeat();
//      await _controller
//          .forward()
//          .orCancel;
//      await _controller
//          .reverse()
//          .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.blue,
      height: 200.0,
      width: 200.0,
      padding: movement.value,
      child: new Center(
        child: new Text(
          'movement',
          style: new TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}

class RadiusAniWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RadiusAniWidgetState();
  }
}

class _RadiusAniWidgetState extends State<RadiusAniWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<BorderRadius> radius;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  void _initAni() {
    radius = radius = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(100.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          0.8,
          curve: Curves.ease,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
  }

  Future _startAnimation() async {
    try {
      await _controller.repeat();
//      await _controller
//          .forward()
//          .orCancel;
//      await _controller
//          .reverse()
//          .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      width: 200.0,
      child: new Center(
        child: new Text(
          'radius',
          style: new TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.purple,
        border: Border.all(
          color: Colors.purple,
          width: 2.0,
        ),
        borderRadius: radius.value,
      ),
    );
  }
}

class ColorAniWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ColorAniWidgetState();
  }
}

class _ColorAniWidgetState extends State<ColorAniWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<Color> color;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  void _initAni() {
    color = ColorTween(
      begin: Colors.red[100],
      end: Colors.blue[900],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
  }

  Future _startAnimation() async {
    try {
      await _controller.repeat();
//      await _controller
//          .forward()
//          .orCancel;
//      await _controller
//          .reverse()
//          .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: color.value,
      height: 200.0,
      width: 200.0,
      child: new Center(
        child: new Text(
          'color',
          style: new TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}

class RotateAniWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RotateAniWidgetState();
  }
}

class _RotateAniWidgetState extends State<RotateAniWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> rotate;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  void _initAni() {
    rotate = Tween<double>(
      begin: 0.0,
      end: math.pi * 2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.1,
          0.3,
          curve: Curves.ease,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
  }

  Future _startAnimation() async {
    try {
      await _controller.repeat();
//      await _controller
//          .forward()
//          .orCancel;
//      await _controller
//          .reverse()
//          .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      width: 200.0,
      color: Colors.green,
      transform: Matrix4.identity()..rotateZ(rotate.value),
      child: new Center(
        child: new Text(
          'rotate',
          style: new TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}

class DeformAniWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DeformAniWidgetState();
  }
}

class _DeformAniWidgetState extends State<DeformAniWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> width;

  Animation<double> height;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  void _initAni() {
    height = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.3,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });

    width = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
  }

  Future _startAnimation() async {
    try {
      await _controller.repeat();
//      await _controller
//          .forward()
//          .orCancel;
//      await _controller
//          .reverse()
//          .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width.value,
      height: height.value,
      color: Colors.deepPurple,
      child: new Center(
        child: new Text(
          'deform',
          style: new TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}

class StaggeredAniWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StaggeredAniWidgetState();
  }
}

class _StaggeredAniWidgetState extends State<StaggeredAniWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> opacity;

  Animation<EdgeInsets> movement;

  Animation<Color> color;

  Animation<BorderRadius> radius;

  Animation<double> rotate;

  Animation<double> width;

  Animation<double> height;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  void _initAni() {
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.1,
          curve: Curves.easeIn,
        ),
      ),
    );

    rotate = Tween<double>(
      begin: 0.0,
      end: math.pi * 2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.ease,
        ),
      ),
    );

    movement = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 0.0),
      end: EdgeInsets.only(top: 100.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.250,
          0.375,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.blue[300],
      end: Colors.blue[900],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          0.75,
          curve: Curves.linear,
        ),
      ),
    );

    radius = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(100.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          0.75,
          curve: Curves.ease,
        ),
      ),
    );

    height = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.375,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    width = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.375,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  Future _startAnimation() async {
    try {
//      await _controller.repeat();
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget _buildAni(BuildContext context, Widget child) {
    return new Container(
      padding: movement.value,
      transform: Matrix4.identity()..rotateZ(rotate.value),
      child: new Opacity(
        opacity: opacity.value,
        child: new Container(
          width: width.value,
          height: height.value,
          decoration: new BoxDecoration(
            color: color.value,
            border: new Border.all(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: radius.value,
          ),
          child: new Center(
            child: new Text(
              'staggered',
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Padding(
          padding:
          const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: new FlatButton(
              textColor: Colors.black,
              child: new Text('replay staggered'),
              onPressed: () {
                _startAnimation();
              }),
        ),
        new AnimatedBuilder(animation: _controller, builder: _buildAni)
      ],
    );
  }
}
