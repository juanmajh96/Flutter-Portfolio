import 'package:flutter/cupertino.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';

class InheritedBloc extends ChangeNotifier {
  StatePage statePage;

  Future<void> initDemo() async {
    statePage = StatePage.loading;
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.complete;
    notifyListeners();
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1000),
    );
    statePage = StatePage.loading;
    notifyListeners();
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.error;
    notifyListeners();
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.loading;
    notifyListeners();
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
    statePage = StatePage.complete;
    notifyListeners();
  }
}
