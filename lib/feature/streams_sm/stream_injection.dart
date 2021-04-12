import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/streams_sm/stream_bloc.dart';
import 'package:flutter_portfolio/feature/streams_sm/stream_page.dart';

class SteamInjection {
  SteamInjection._();
  static String route = 'Stream';
  static Widget injection() {
    final _streamBloc = StreamBloc()..initDemo();
    return StreamPage(streamBloc: _streamBloc);
  }
}
