import 'package:flutter/material.dart';

import 'package:flutter_portfolio/feature/streams_sm/stream_bloc.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({
    Key key,
    this.streamBloc,
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
        title: const Text('Streams'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Spacer(),
          Expanded(
            child: StreamBuilder<int>(
              stream: widget.streamBloc.streamController.stream,
              builder: (_, AsyncSnapshot<int> snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 90),
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      widget.streamBloc.remove();
                    },
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: FittedBox(
                        child: Text(
                          'Remove',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      widget.streamBloc.add();
                    },
                    color: Colors.green,
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: FittedBox(
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
