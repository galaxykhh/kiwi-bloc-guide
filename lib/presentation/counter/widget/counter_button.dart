import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_bloc_bible/presentation/counter/bloc/counter_bloc.dart';

class CounterButton extends StatelessWidget {
  const CounterButton.increment({
    Key? key,
  })  : _isIncrement = true,
        super(key: key);

  const CounterButton.decrement({
    Key? key,
  })  : _isIncrement = false,
        super(key: key);

  final bool _isIncrement;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final CounterEvent event = _isIncrement ? CounterIncrementPressed() : CounterDecrementPressed();
        context.read<CounterBloc>().add(event);
      },
      child: Text(_label),
    );
  }

  String get _label => _isIncrement ? 'increase' : 'decrease';
}
