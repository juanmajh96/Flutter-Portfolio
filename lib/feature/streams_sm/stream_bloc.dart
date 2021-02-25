import 'dart:async';

import 'package:flutter_portfolio/core/entities/state_page.dart';

class StreamBloc {
  final StreamController<StatePage> _streamController =
      StreamController<StatePage>();

  StreamController<StatePage> get streamController => _streamController;

  StatePage statePage;

  Future<void> initDemo() async {
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.complete;
    if (!_streamController.isClosed) {
      _streamController.sink.add(statePage);
    }
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1000),
    );
    statePage = StatePage.loading;
    if (!_streamController.isClosed) {
      _streamController.sink.add(statePage);
    }
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.error;
    if (!_streamController.isClosed) {
      _streamController.sink.add(statePage);
    }
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.loading;
    if (!_streamController.isClosed) {
      _streamController.sink.add(statePage);
    }
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.complete;
    if (!_streamController.isClosed) {
      _streamController.sink.add(statePage);
    }
  }
}
