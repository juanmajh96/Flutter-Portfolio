import 'package:flutter/material.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({Key key}) : super(key: key);
  static String route = 'SetState';
  @override
  _SetStatePageState createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Spacer(),
          Expanded(
            child: Text(
              number.toString(),
              style: const TextStyle(fontSize: 90),
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
                      number--;
                      setState(() {});
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
                      number++;
                      setState(() {});
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
