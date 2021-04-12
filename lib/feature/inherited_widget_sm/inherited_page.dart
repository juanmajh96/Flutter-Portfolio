import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';
import 'package:flutter_portfolio/feature/inherited_widget_sm/inherited_bloc.dart';

class InheritedPage extends StatelessWidget {
  const InheritedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _inheritedBloc = HomeInheritedWidget.of(context)!.inheritedBloc;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Widget'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _inheritedBloc,
        builder: (_, __) {
          if (_inheritedBloc.statePage == StatePage.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_inheritedBloc.statePage == StatePage.complete) {
            return const Center(
              child: Text(
                'Complete',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return const Center(
            child: Text(
              'Error',
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}

class HomeInheritedWidget extends InheritedWidget {
  const HomeInheritedWidget({
    Key? key,
    required this.child,
    required this.inheritedBloc,
  }) : super(key: key, child: child);

  @override
  // ignore: overridden_fields
  final Widget child;
  final InheritedBloc inheritedBloc;

  static HomeInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
