import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/inherited_widget_sm/inherited_page.dart';

import 'inherited_bloc.dart';

class InheritedInjection {
  InheritedInjection._();
  static String route = 'inherited';
  static Widget injection() {
    return HomeInheritedWidget(
      inheritedBloc: InheritedBloc()..initDemo(),
      child: const InheritedPage(),
    );
  }
}
