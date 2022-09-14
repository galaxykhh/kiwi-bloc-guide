import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_bloc_bible/presentation/counter_cubit/cubit/counter_cubit.dart';

class CounterCubitButton extends StatelessWidget {
  const CounterCubitButton.increment({
    Key? key,
  })  : _isIncrement = true,
        super(key: key);

  const CounterCubitButton.decrement({
    Key? key,
  })  : _isIncrement = false,
        super(key: key);

  final bool _isIncrement;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return ElevatedButton(
      onPressed: _isIncrement ? cubit.increment : cubit.decrement,
      child: Text(_label),
    );
  }

  String get _label => _isIncrement ? 'increase' : 'decrease';
}
