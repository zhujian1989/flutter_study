import 'package:flutter/material.dart';

class BlinkingToastWidget extends StatefulWidget {
  BlinkingToastWidget({
    Key key,
    @required this.widget,
    @required this.position,
  }): super(key: key);

  final Widget widget;
  final Offset position;

  @override
  _BlinkingToastWidgetState createState() => new _BlinkingToastWidgetState();
}

class _BlinkingToastWidgetState extends State<BlinkingToastWidget>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 0.5)
    ))
      ..addListener(() {
        if (mounted){
          setState(() {
            // Refresh
          });
        }
      })
      ..addStatusListener((AnimationStatus status){
        if (status == AnimationStatus.completed){
          _controller.reverse().orCancel;
        } else if (status == AnimationStatus.dismissed){
          _controller.forward().orCancel;
        }
      });
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top:  widget.position.dy,
        left: widget.position.dx,
        child: new IgnorePointer(
          child: new Material(
            color: Colors.transparent,
            child: new Opacity(
              opacity: _animation.value,
              child: widget.widget,
            ),
          ),
        ));
  }
}
