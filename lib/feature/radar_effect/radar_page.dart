import 'package:flutter/material.dart';
import 'package:flutter_portfolio/common_widgets/app_bar.dart';
import 'package:flutter_portfolio/feature/radar_effect/widgets/radar_animation.dart';

class RadarPage extends StatelessWidget {
  const RadarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarClose(
        title: 'Radar Animation',
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                RadarAnimation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
