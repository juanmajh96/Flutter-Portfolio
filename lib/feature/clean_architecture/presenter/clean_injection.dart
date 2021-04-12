import 'package:flutter/material.dart';
import 'presenter.dart';

class CleanInjection {
  CleanInjection._();
  static String route = 'CleanPage';
  static Widget injection() {
    return const CleanPage();
  }
}
