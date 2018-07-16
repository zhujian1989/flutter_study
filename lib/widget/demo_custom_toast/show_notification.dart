import 'package:flutter/material.dart';
import 'dart:async';

class ShowNotificationIcon {

  void show(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = new OverlayEntry(builder: _build);

    overlayState.insert(overlayEntry);

    await new Future.delayed(const Duration(seconds: 2));

    overlayEntry.remove();
  }

  Widget _build(BuildContext context){
    return new Positioned(
      top: 50.0,
      left: 50.0,
      child: new Material(
        color: Colors.transparent,
        child: new Icon(Icons.warning, color: Colors.purple),
      ),
    );
  }
}
