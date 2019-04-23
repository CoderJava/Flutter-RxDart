import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int initialCount = 0;
  BehaviorSubject<int> _subjectCounter;

  CounterBloc(this.initialCount) {
    _subjectCounter = BehaviorSubject<int>.seeded(initialCount);
  }

  Observable<int> get counterObservable {
    return _subjectCounter.stream;
  }

  void increment() {
    initialCount++;
    _subjectCounter.sink.add(initialCount);
  }

  void decrement() {
    initialCount--;
    _subjectCounter.sink.add(initialCount);
  }

  void dispose() {
    _subjectCounter.close();
  }
}
