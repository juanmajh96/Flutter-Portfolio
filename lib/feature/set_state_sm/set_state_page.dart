import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({Key key}) : super(key: key);
  static String route = 'SetState';
  @override
  _SetStatePageState createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  int number = 0;
  StatePage statePage = StatePage.loading;
  @override
  void initState() {
    initDemo();
    super.initState();
  }

  Future<void> initDemo() async {
    _delayed(1400);
    statePage = StatePage.complete;
    if (mounted) {
      setState(() {});
    }
    _delayed(1000);
    statePage = StatePage.loading;
    if (mounted) {
      setState(() {});
    }
    _delayed(1200);
    statePage = StatePage.error;
    if (mounted) {
      setState(() {});
    }
    _delayed(1400);
    statePage = StatePage.loading;
    if (mounted) {
      setState(() {});
    }
    _delayed(1400);
    statePage = StatePage.complete;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _delayed(int milliseconds) async {
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (_) {
          if (statePage == StatePage.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (statePage == StatePage.complete) {
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
