import 'package:flutter/material.dart';

import 'inifinity_page.dart';

class InfinityInjection {
  InfinityInjection._();

  static String route = 'infinity';
  static Widget injection() {
    return const InfinityPage();
  }
}
