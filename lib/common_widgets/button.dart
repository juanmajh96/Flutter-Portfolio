import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/entities/button_propieties.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.feature, required this.function})
      : super(key: key);

  final ButtonPropieties feature;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: feature.seen
          ? MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              color: Colors.grey,
              textColor: Colors.white,
              onPressed: () {
                feature.seen = true;
                // ignore: avoid_dynamic_calls
                function();
                Navigator.pushNamed(context, feature.route, arguments: feature);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(feature.title),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.check_circle_outline_sharp,
                    size: 17,
                  )
                ],
              ),
            )
          : MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                feature.seen = true;
                // ignore: avoid_dynamic_calls
                function();
                Navigator.pushNamed(context, feature.route, arguments: feature);
              },
              child: Text(feature.title),
            ),
    );
  }
}
