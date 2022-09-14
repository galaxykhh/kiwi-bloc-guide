import 'package:flutter/material.dart';

extension ContextRouter on BuildContext {
  Future<T?> push<T>(
    Widget screen, {
    RouteSettings? settings,
    bool rootNavigator = false,
    bool fullscreenDialog = false,
  }) async {
    final T? result = await Navigator.of(this, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      ),
    );

    return result;
  }

  Future<T?> pushNamed<T>(
    String routeName, {
    RouteSettings? settings,
    bool rootNavigator = false,
    Object? arguments,
  }) async {
    final T? result = await Navigator.of(this, rootNavigator: rootNavigator).pushNamed(
      routeName,
      arguments: arguments,
    );
    return result;
  }

  void pop<T>({
    T? result,
    bool rootNavigator = false,
  }) {
    Navigator.of(this, rootNavigator: rootNavigator).pop(result);
  }

  Future<T?> popAndPushNamed<T, E>(
    String routeName, {
    bool rootNavigator = false,
  }) async {
    final T? result = await Navigator.popAndPushNamed(this, routeName);
    return result;
  }

  Future<T?> openDialog<T>() async {
    final T? result = await showDialog(
      context: this,
      builder: (context) {
        return const AlertDialog();
      },
    );
    return result;
  }
}
