import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/shimmer_effect/widgets/shimmer_animation.dart';

class ShimmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Animation'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                const ShimmerAnimation(),
                const SizedBox(
                  height: 20,
                ),
                const ShimmerAnimation(
                  color: Colors.blue,
                  borderRadius: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                ShimmerAnimation(
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  width: double.infinity,
                  height: 99,
                  color: Colors.grey[400],
                  borderRadius: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
