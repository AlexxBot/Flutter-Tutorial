import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int initialCount =
      0; //if the data is not passed by paramether it initializes with 0
  late BehaviorSubject<int> _subjectCounter;
  late PublishSubject<int> _subjectCounter2;

  CounterBloc({required this.initialCount}) {
    _subjectCounter = new BehaviorSubject<int>.seeded(
        this.initialCount); //initializes the subject with element already

    _subjectCounter2 = new PublishSubject<int>();
  }

  //Observable<int> get counterObservable => _subjectCounter.stream;

  Stream<int> get counterObservable => _subjectCounter.stream;

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
