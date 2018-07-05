import 'dart:async';

main() {
//  List<int> myList = [1,2,3,4,5,6,7];
//
//
//  Stream firstStream = testStream(myList);
//
//  firstStream.listen((int e){ // ignore: argument_type_not_assignable
//    print(e);
//  });
//

//  StreamSubscription subscription =
//      asynchronousNaturals.listen(null); // ignore: cancel_subscriptions
//  subscription.onData((value) {
//    print(value);
//  });

  print(naturalsDownFrom(3));
}

int level = 0;

Iterable naturalsDownFrom(n) sync* {
  level++;

  if (n > 0) {
    print("level: $level n:$n");
    yield n;

    for (int i in naturalsDownFrom(n-1)) {
      print("level: $level i:$i");
      yield i;
    }
  }
}
Stream<int> testStream(Iterable<int> stuffToStream) async* {
  for (int i in stuffToStream) {
    yield i;
  }
}

Stream get asynchronousNaturals async* {
  print("Begin");

  int k = 0;
  while (k < 3) {
    print("Before Yield");
    yield k++;
  }

  print("End");
}
