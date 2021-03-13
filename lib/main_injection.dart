import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'main_bloc.dart';
import 'main_page.dart';

class MainInjection {
  MainInjection._();

  static Widget injection() {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<MainBloc>(
          create: (_) => MainBloc(),
        )
      ],
      child: const MainPage(),
    );
  }
}
