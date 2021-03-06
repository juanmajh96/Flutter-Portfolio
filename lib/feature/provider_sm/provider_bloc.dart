import 'package:flutter/foundation.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';

class ProviderBloc {
  final ValueNotifier<StatePage> statePage =
      ValueNotifier<StatePage>(StatePage.loading);

  Future<void> initDemo() async {
    statePage.value = StatePage.loading;
    await _delayed(1400);
    statePage.value = StatePage.complete;
    await _delayed(1000);
    statePage.value = StatePage.loading;
    await _delayed(1400);
    statePage.value = StatePage.error;
    await _delayed(1400);
    statePage.value = StatePage.loading;
    await _delayed(1400);
    statePage.value = StatePage.complete;
  }

  Future<void> _delayed(int milliseconds) async {
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
  }
}
