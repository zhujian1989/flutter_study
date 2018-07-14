import 'dart:async';

import 'package:flutter_study/model/search_model.dart';
import 'package:rxdart/rxdart.dart';

Stream<int> timedCounter(Duration interval, [int maxCount]) {
  StreamController<int> controller;
  Timer timer;
  int counter = 0;

  void tick(_) {
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (maxCount != null && counter >= maxCount) {
      timer.cancel();
      controller.close();    // Ask stream to shut down and tell listeners.
    }
  }

  void startTimer() {
    timer = new Timer.periodic(interval, tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  controller = new StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);

  return controller.stream;
}

main() {
//  Stream<int> counterStream = timedCounter(const Duration(seconds: 1), 10).map((int x){
//    return x * 1;
//  });
//
//  StreamSubscription<int> subscription;
//  subscription = counterStream.listen((int counter) {
//    print(counter);  // Print an integer every second.
//    if (counter == 5) {
//      // After 5 ticks, pause for five seconds, then resume.
//      subscription.pause();
//      new Timer(const Duration(seconds: 5), subscription.resume);
//    }
//  });

//  new Timer(new Duration(seconds: 5), (){
//    counterStream.listen((int x){
//      print(x);
//    });
//  });


//  new Observable(new Stream.fromIterable([1]))
//      .interval(new Duration(seconds: 1))
//      .flatMap((i) => new Observable.just([1,2,3,4]))
//      .take(1)
//      .listen(print);

//  final subject = new PublishSubject<int>();

// observer1 will receive all data and done events
//  subject.stream.listen((int x){
//    print('observer1:$x');
//  });
//  subject.add(1);
//  subject.add(2);

// observer2 will only receive 3 and done event
//  subject.stream.listen((int x){
//    print('observer2:$x');
//  });
//  subject.add(3);
//  subject.close();


//  final subject = new BehaviorSubject<int>(); // ignore: close_sinks

//  subject.add(1);
//  subject.add(2);
//  subject.add(3);
//
//  subject.stream.listen(print); // prints 3
//  subject.stream.listen(print); // prints 3
//  subject.stream.listen(print); // prints 3


//  final subject = new ReplaySubject<int>(maxSize: 2);
//
//  subject.add(1);
//  subject.add(2);
//  subject.add(3);
//
//  subject.stream.listen(print); // prints 1, 2, 3
//  subject.stream.listen(print); // prints 1, 2, 3
//  subject.stream.listen(print); // prints 1, 2, 3


//  new ConcatStream([
//    new Stream.fromIterable([1]),
//    new TimerStream(2, new Duration(days: 1)),
//    new Stream.fromIterable([3])
//  ])
//      .listen(print);


//  new Observable.fromIterable([1, 2]).withLatestFrom(
//             new Observable.fromIterable([2, 3]), (a, b) => a + b)
//             .listen(print);



  var data = [1,2,3,4,5];
  var stream = new Stream.fromIterable(data);
  var broadcastStream = stream.asBroadcastStream();

  broadcastStream
      .any((value) => value < 5)
      .then((result) => print("Any less than 5?: $result")); // true

  broadcastStream
      .every((value) => value < 5)
      .then((result) => print("All less than 5?: $result")); // false

  broadcastStream
      .contains(4)
      .then((result) => print("Contains 4?: $result")); // true
}

