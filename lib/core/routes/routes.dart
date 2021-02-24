import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/generic_pages.dart/generic_pages.dart';
import 'package:flutter_portfolio/feature/rebound_effect/rebound_injection.dart';
import 'package:flutter_portfolio/feature/shimmer_effect/shimmer_injection.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ShimmerInjection.route: (BuildContext context) =>
        ShimmerInjection.injection(),
    ReboundInjection.route: (BuildContext context) =>
        ReboundInjection.injection(),
    AnimationsPage.route: (BuildContext context) => const AnimationsPage(),
    StateManagementPage.route: (BuildContext context) =>
        const StateManagementPage(),
  };
}
