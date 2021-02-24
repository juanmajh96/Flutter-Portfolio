import 'dart:async';

class StreamBloc {
  final StreamController<int> _streamController = StreamController<int>();

  StreamController<int> get streamController => _streamController;

  int number = 0;

  void init() {
    _streamController.sink.add(0);
  }

  Future<void> add() async {
    number++;
    _streamController.sink.add(number);
  }

  Future<void> remove() async {
    number--;
    _streamController.sink.add(number);
  }
}
