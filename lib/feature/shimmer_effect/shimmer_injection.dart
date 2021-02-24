import 'package:flutter/material.dart';

import 'shimmer_page.dart';

class ShimmerInjection {
  ShimmerInjection._();
  static String route = 'Shimmer';
  static Widget injection() {
    return ShimmerPage();
  }
}
