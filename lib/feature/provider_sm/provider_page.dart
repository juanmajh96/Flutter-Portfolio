import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/entities/state_page.dart';
import 'package:flutter_portfolio/feature/provider_sm/provider_bloc.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderBloc _providerBloc = Provider.of<ProviderBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<StatePage>(
        valueListenable: _providerBloc.statePage,
        builder: (_, StatePage value, ___) {
          if (value == StatePage.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value == StatePage.complete) {
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
