import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/streams_sm/stream_bloc.dart';
import 'package:flutter_portfolio/feature/streams_sm/stream_page.dart';

class SteamInjection {
  SteamInjection._();
  static String route = 'SetState';
  static Widget injection() {
    final StreamBloc _streamBloc = StreamBloc()..init();
    return StreamPage(streamBloc: _streamBloc);
  }
}
