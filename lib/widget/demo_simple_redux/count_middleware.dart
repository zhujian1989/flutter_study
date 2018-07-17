import 'package:redux/redux.dart';
import 'package:flutter_study/widget/demo_simple_redux/count_redux.dart';

class CountMiddleware extends MiddlewareClass<int> {
         call(Store<int> store, action, NextDispatcher next) {
           if(store.state == 0 && action == Actions.Reduce){
             return;
           }
           next(action);
         }
       }
