import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'feature/home_page.dart/home_page_injection.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      routes: routes(),
      home: HomePageInjection.injection(),
    );
  }
}
