import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_bloc_bible/presentation/counter/bloc/counter_bloc.dart';
import 'package:kiwi_bloc_bible/presentation/counter/widget/counter_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  static const String routeName = 'counter';

  static Route route() => MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (context) => CounterBloc(),
          child: const CounterScreen(),
        );
      });

  @override
  Widget build(BuildContext context) {
    print('CounterScreen Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('카운터'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) => state.count,
              builder: (context, count) {
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
            const SizedBox(height: 40),
            const CounterButton.increment(),
            const SizedBox(height: 10),
            const CounterButton.decrement(),
          ],
        ),
      ),
    );
  }
}
