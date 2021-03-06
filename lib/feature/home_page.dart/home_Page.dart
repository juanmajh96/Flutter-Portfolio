import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/entities/category_entities.dart';
import 'package:flutter_portfolio/core/entities/feature_entities.dart';
import 'package:flutter_portfolio/core/sources/list_feature.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter portfolio'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: category
                  .map(
                    (Category feature) => MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        feature.route,
                        arguments: Feature(
                          feature.route,
                          feature.title,
                        ),
                      ),
                      child: Text(feature.title),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
