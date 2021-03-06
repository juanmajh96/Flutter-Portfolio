import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';

import 'package:flutter_portfolio/feature/streams_sm/stream_bloc.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({
    Key? key,
    required this.streamBloc,
  }) : super(key: key);

  final StreamBloc streamBloc;
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  void dispose() {
    widget.streamBloc.streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
        centerTitle: true,
      ),
      body: StreamBuilder<StatePage>(
        initialData: StatePage.loading,
        stream: widget.streamBloc.streamController.stream,
        builder: (_, AsyncSnapshot<StatePage> snapshot) {
          if (snapshot.data == StatePage.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == StatePage.complete) {
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
