import 'package:flutter/material.dart';

import 'rebound_page.dart';

class ReboundInjection {
  ReboundInjection._();
  static String route = 'Rebound';
  static Widget injection() {
    return const ReboundPage();
  }
}
