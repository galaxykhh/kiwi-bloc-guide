import 'package:flutter/material.dart';
import 'package:kiwi_bloc_bible/presentation/counter/screen/counter_screen.dart';
import 'package:kiwi_bloc_bible/presentation/home/screen/home_sceen.dart';
import 'package:kiwi_bloc_bible/presentation/infinite_scroll/screen/infinite_scroll_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();

      case CounterScreen.routeName:
        return CounterScreen.route();

      case InfiniteScrollScreen.routeName:
      default:
        return InfiniteScrollScreen.route();
    }
  }
}
