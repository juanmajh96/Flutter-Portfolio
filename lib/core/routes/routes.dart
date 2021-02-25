import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/generic_pages.dart/generic_pages.dart';
import 'package:flutter_portfolio/feature/infinity_effect/inifinity_injection.dart';
import 'package:flutter_portfolio/feature/inherited_widget_sm/inherited_injection.dart';
import 'package:flutter_portfolio/feature/provider_sm/provider_injection.dart';
import 'package:flutter_portfolio/feature/rebound_effect/rebound_injection.dart';
import 'package:flutter_portfolio/feature/set_state_sm/set_state_page.dart';
import 'package:flutter_portfolio/feature/shimmer_effect/shimmer_injection.dart';
import 'package:flutter_portfolio/feature/streams_sm/stream_injection.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ShimmerInjection.route: (BuildContext context) =>
        ShimmerInjection.injection(),
    ReboundInjection.route: (BuildContext context) =>
        ReboundInjection.injection(),
    AnimationsPage.route: (BuildContext context) => const AnimationsPage(),
    StateManagementPage.route: (BuildContext context) =>
        const StateManagementPage(),
    SetStatePage.route: (BuildContext context) => const SetStatePage(),
    SteamInjection.route: (BuildContext context) => SteamInjection.injection(),
    InheritedInjection.route: (BuildContext context) =>
        InheritedInjection.injection(),
    ProviderInjection.route: (BuildContext context) =>
        ProviderInjection.injection(),
    InfinityInjection.route: (BuildContext context) =>
        InfinityInjection.injection(),
  };
}
