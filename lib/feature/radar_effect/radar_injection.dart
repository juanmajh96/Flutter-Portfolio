import 'package:flutter/material.dart';

import 'radar_page.dart';

class RadarInjection {
  RadarInjection._();

  static String route = 'radar';
  static Widget injection() {
    return const RadarPage();
  }
}
