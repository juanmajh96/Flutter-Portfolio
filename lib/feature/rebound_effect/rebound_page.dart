import 'package:flutter/material.dart';

import 'widgets/rebound_animation.dart';

class ReboundPage extends StatelessWidget {
  const ReboundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebound Animation'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const <Widget>[
                ReboundAnimation(
                  axis: Axis.vertical,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: FittedBox(
                      child: Text(
                        'J',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ReboundAnimation(
                  duration: Duration(milliseconds: 2000),
                  axis: Axis.horizontal,
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ReboundAnimation(
                  axis: Axis.horizontal,
                  duration: Duration(milliseconds: 1500),
                  offset: 300,
                  child: Text(
                    'Welcome to flutter animations',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
