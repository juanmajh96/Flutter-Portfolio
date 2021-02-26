import 'package:flutter_portfolio/core/entities/category_entities.dart';
import 'package:flutter_portfolio/core/entities/feature_entities.dart';
import 'package:flutter_portfolio/feature/generic_pages.dart/generic_pages.dart';
import 'package:flutter_portfolio/feature/radar_effect/radar_injection.dart';
import 'package:flutter_portfolio/feature/inherited_widget_sm/inherited_injection.dart';
import 'package:flutter_portfolio/feature/provider_sm/provider_injection.dart';
import 'package:flutter_portfolio/feature/rebound_effect/rebound_injection.dart';
import 'package:flutter_portfolio/feature/set_state_sm/set_state_page.dart';
import 'package:flutter_portfolio/feature/shimmer_effect/shimmer_injection.dart';
import 'package:flutter_portfolio/feature/streams_sm/stream_injection.dart';

List<Category> category = <Category>[
  Category(AnimationsPage.route, 'Animations'),
  Category(StateManagementPage.route, 'StateManagement'),
];

List<Feature> animationsList = <Feature>[
  Feature(RadarInjection.route, 'radar'),
  Feature(ReboundInjection.route, 'Rebound'),
  Feature(ShimmerInjection.route, 'Shimmer'),
];

List<Feature> stateManagementList = <Feature>[
  Feature(SetStatePage.route, 'SetState'),
  Feature(SteamInjection.route, 'Streams'),
  Feature(InheritedInjection.route, 'InheritedWidget'),
  Feature(ProviderInjection.route, 'Provider'),
  Feature(ShimmerInjection.route, 'Riverpod'),
];
