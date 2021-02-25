import 'package:flutter/foundation.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';

class ProviderBloc {
  final ValueNotifier<StatePage> statePage =
      ValueNotifier<StatePage>(StatePage.loading);

  Future<void> initDemo() async {
    statePage.value = StatePage.loading;
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage.value = StatePage.complete;

    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1000),
    );
    statePage.value = StatePage.loading;

    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage.value = StatePage.error;

    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage.value = StatePage.loading;

    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage.value = StatePage.complete;
  }
}
