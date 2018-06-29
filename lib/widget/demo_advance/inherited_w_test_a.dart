import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_advance/inherited_w_test_b.dart';
import 'package:flutter_study/widget/demo_advance/inherited_w_page.dart';

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);

    final inheritedTestModel = inheritedContext.inheritedTestModel;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InheritedWidgetTest'),
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('我们常使用的\nTheme.of(context).textTheme\nMediaQuery.of(context).size等\n就是通过InheritedWidget实现的',
              style: new TextStyle(fontSize: 20.0),),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('+'),
                onPressed: inheritedContext.increment),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('${inheritedTestModel.count}'),
                onPressed: inheritedContext.increment),
          ),
          new TestWidgetB(),
        ],
      ),
    );
  }
}


