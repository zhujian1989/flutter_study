import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

const double drag_item_height = 80.0;

const List<Color> random_colors_list = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.indigoAccent,
  Colors.blue,
  Colors.purple
];

class DragModel {
  final Offset itemPos;

  final String itemName;

  final Color itemBgColor;

  DragModel(this.itemPos, this.itemName, this.itemBgColor);
}

double appBarHeight = 0.0;

double statusBarHeight = 0.0;

double screenHeight = 0.0;

double screenWidth = 0.0;

class DragPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DragPageState();
  }
}

class _DragPageState extends State<DragPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildAppbar() {
    var appBar = new AppBar(title: new Text("drag"));

    statusBarHeight = MediaQuery.of(context).padding.top;

    appBarHeight = appBar.preferredSize.height;

    screenHeight = MediaQuery.of(context).size.height;

    screenWidth = MediaQuery.of(context).size.width;

    return appBar;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppbar(),
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new DragItem(new DragModel(Offset(0.0, 0.0), '红', Colors.red)),
            new DragItem(new DragModel(
                Offset(0.0, 1 * drag_item_height), '橙', Colors.orange)),
            new DragItem(new DragModel(
                Offset(0.0, 2 * drag_item_height), '黄', Colors.yellow)),
            new DragItem(new DragModel(
                Offset(0.0, 3 * drag_item_height), '绿', Colors.green)),
            new DragItem(new DragModel(
                Offset(0.0, 4 * drag_item_height), '青', Colors.indigoAccent)),
            new DragItem(new DragModel(
                Offset(0.0, 5 * drag_item_height), '蓝', Colors.blue)),
            new DragItem(new DragModel(
                Offset(0.0, 6 * drag_item_height), '紫', Colors.purple)),
            new DragDestination(),
          ],
        ),
      ),
    );
  }
}

class DragDestination extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DragDestinationState();
  }
}

class _DragDestinationState extends State<DragDestination> {
  Color _curRandomColor = Colors.red;

  int _score = 0;

  Timer _timer;

  _randomColor() {
    int index = new Random().nextInt(6);
    _curRandomColor = random_colors_list[index];
  }

  _startTimer() {
    _timer = new Timer.periodic(new Duration(seconds: 2), (timer) {
      setState(() {
        _randomColor();
      });
    });
  }

  _cancelTimer() {
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0.0,
      child: DragTarget(
        onAccept: (DragModel model) {
          if (model.itemBgColor == _curRandomColor) {
            _score++;
          }
        },
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: _curRandomColor,
            ),
            child: Center(
              child: Text(
                "放入正确的颜色\n您的得分：$_score",
                style: new TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DragItem extends StatefulWidget {
  //初始化位置
  final DragModel dragModel;

  DragItem(this.dragModel);

  @override
  State<StatefulWidget> createState() {
    return new _DragItemState();
  }
}

class _DragItemState extends State<DragItem> {
  Offset pos = new Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    pos = widget.dragModel.itemPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: pos.dx,
        top: pos.dy,
        child: Draggable(
          data: widget.dragModel,
          child: Container(
            width: drag_item_height,
            height: drag_item_height,
            color: widget.dragModel.itemBgColor,
            child: Center(
              child: Text(
                widget.dragModel.itemName,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            if (!mounted) return;
            setState(() {
              //坐标是根据全屏算的，需要计算appbar和statusBar的高度

              double dx = offset.dx;
              double dy = offset.dy - appBarHeight - statusBarHeight;

              //临界点判断
              if (dx < 0) {
                dx = 0.0;
              }

              if (dx > screenWidth - drag_item_height) {
                dx = screenWidth - drag_item_height;
              }

              if (dy < 0) {
                dy = 0.0;
              }

              if (offset.dy + drag_item_height > screenHeight) {
                dy = screenHeight -
                    drag_item_height -
                    appBarHeight -
                    statusBarHeight;
              }

              pos = new Offset(dx, dy);

            });
          },
          feedback: Container(
            width: drag_item_height,
            height: drag_item_height,
            color: widget.dragModel.itemBgColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.dragModel.itemName,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ));
  }
}
