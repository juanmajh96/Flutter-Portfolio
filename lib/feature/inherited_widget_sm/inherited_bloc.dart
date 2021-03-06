import 'package:flutter/cupertino.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';

class InheritedBloc extends ChangeNotifier {
  StatePage statePage = StatePage.loading;

  Future<void> initDemo() async {
    statePage = StatePage.loading;
    await _delayed(1400);
    statePage = StatePage.complete;
    notifyListeners();
    await _delayed(1000);
    statePage = StatePage.loading;
    notifyListeners();
    await _delayed(1400);
    statePage = StatePage.error;
    notifyListeners();
    await _delayed(1400);
    statePage = StatePage.loading;
    notifyListeners();
    await _delayed(1400);
    statePage = StatePage.complete;
    notifyListeners();
  }

  Future<void> _delayed(int milliseconds) async {
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
  }
}
