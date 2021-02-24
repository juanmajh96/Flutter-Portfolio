import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/entities/feature_entities.dart';
import 'package:flutter_portfolio/core/sources/list_feature.dart';

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({
    Key key,
  }) : super(key: key);
  static String route = 'StateManagement';

  @override
  Widget build(BuildContext context) {
    final Feature featureArg =
        ModalRoute.of(context).settings.arguments as Feature;
    return Scaffold(
      appBar: AppBar(
        title: Text(featureArg.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: stateManagementList
                  .map(
                    (Feature feature) => MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () =>
                          Navigator.pushNamed(context, feature.route),
                      child: Text(feature.title),
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
    Key key,
  }) : super(key: key);
  static String route = 'Animations';

  @override
  Widget build(BuildContext context) {
    final Feature featureArg =
        ModalRoute.of(context).settings.arguments as Feature;
    return Scaffold(
      appBar: AppBar(
        title: Text(featureArg.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: animationsList
                  .map(
                    (Feature feature) => MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () =>
                          Navigator.pushNamed(context, feature.route),
                      child: Text(feature.title),
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
