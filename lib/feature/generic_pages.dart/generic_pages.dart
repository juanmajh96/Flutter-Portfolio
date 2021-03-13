import 'package:flutter/material.dart';
import 'package:flutter_portfolio/common_widgets/button.dart';
import 'package:flutter_portfolio/core/entities/button_propieties.dart';
import 'package:flutter_portfolio/core/entities/feature_entities.dart';
import 'package:flutter_portfolio/core/sources/list_feature.dart';

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({
    Key? key,
  }) : super(key: key);
  static String route = 'StateManagement';

  @override
  Widget build(BuildContext context) {
    final ButtonPropieties featureArg =
        ModalRoute.of(context)!.settings.arguments as ButtonPropieties;
    return Scaffold(
      appBar: AppBar(
        title: Text(featureArg.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Wrap(
              children: stateManagementList
                  .map(
                    (Feature feature) => Button(
                      feature: feature,
                      function: () => (context as Element).markNeedsBuild(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({
    Key? key,
  }) : super(key: key);
  static String route = 'Animations';

  @override
  Widget build(BuildContext context) {
    final ButtonPropieties featureArg =
        ModalRoute.of(context)!.settings.arguments as ButtonPropieties;
    return Scaffold(
      appBar: AppBar(
        title: Text(featureArg.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Wrap(
              children: animationsList
                  .map(
                    (Feature feature) => Button(
                      feature: feature,
                      function: () => (context as Element).markNeedsBuild(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
