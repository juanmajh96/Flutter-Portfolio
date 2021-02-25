import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/provider_sm/provider_bloc.dart';
import 'package:flutter_portfolio/feature/provider_sm/provider_page.dart';
import 'package:provider/provider.dart';

class ProviderInjection {
  ProviderInjection._();
  static String route = 'provider';
  static Widget injection() {
    return Provider<ProviderBloc>(
      create: (_) => ProviderBloc()..initDemo(),
      child: const ProviderPage(),
    );
  }
}
