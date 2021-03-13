import 'package:flutter/material.dart';
import 'package:flutter_portfolio/common_widgets/button.dart';
import 'package:flutter_portfolio/core/entities/category_entities.dart';
import 'package:flutter_portfolio/core/sources/list_feature.dart';
import 'package:flutter_portfolio/main_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainBloc _mainBloc = Provider.of<MainBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter portfolio'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ValueListenableBuilder<bool>(
              valueListenable: _mainBloc.homePage$,
              builder: (_, __, ___) {
                return Wrap(
                  children: category
                      .map(
                        (Category feature) => Button(
                          feature: feature,
                          function: () => _mainBloc.homePage$.value =
                              !_mainBloc.homePage$.value,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
