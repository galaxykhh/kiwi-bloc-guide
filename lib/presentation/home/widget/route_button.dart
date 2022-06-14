import 'package:flutter/material.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
