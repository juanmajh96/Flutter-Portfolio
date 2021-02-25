import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/infinity_effect/widgets/infinity_animation.dart';

class InfinityPage extends StatelessWidget {
  const InfinityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinity Animation'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: const <Widget>[
                InfinityAnimation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
