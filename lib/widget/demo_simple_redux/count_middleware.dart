import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_simple_redux/count_redux.dart';
import 'package:redux/redux.dart';

class CountMiddleware extends MiddlewareClass<int> {

  final GlobalKey<ScaffoldState> key;

  CountMiddleware(this.key);

         call(Store<int> store, action, NextDispatcher next) {
           if(store.state == 0 && action == Actions.Decrement){
             key.currentState.showSnackBar(new SnackBar(content: new Text('数字不能为负'))) ;
             return;
           }
           next(action);
         }
       }
