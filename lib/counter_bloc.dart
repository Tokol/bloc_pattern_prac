import 'dart:async';

enum CounterAction {
  Increment, Decrement, Reset
}
class CounterBloc{
  int counter;

  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;




  final _eventstateStreamController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventstateStreamController.sink;

  Stream<CounterAction> get eventStream => _eventstateStreamController.stream;

CounterBloc(){
  counter = 0;
  eventStream.listen((event) {
    if(event==CounterAction.Increment){
      counter++;
    }

    else if(event==CounterAction.Decrement){
      counter--;
    }

    else{
      counter = 0;
    }
    counterSink.add(counter);
  });


}
//eventStreamController;




}