import 'package:flutter/material.dart';

class AppBarClose extends StatelessWidget implements PreferredSizeWidget {
  const AppBarClose({
    Key? key,
    required this.title,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
  }) : super(key: key);

  final String title;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
