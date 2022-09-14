import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_bloc_bible/presentation/counter_cubit/cubit/counter_cubit.dart';
import 'package:kiwi_bloc_bible/presentation/counter_cubit/widget/counter_cubit_button.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({Key? key}) : super(key: key);

  static const String routeName = 'counter cubit';

  static Route route() => MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (context) => CounterCubit(),
          child: const CounterCubitScreen(),
        );
      });

  @override
  Widget build(BuildContext context) {
    print('CounterCubitScreen Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('카운터 큐빗'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CounterCubit, CounterState, int>(
              selector: (state) => state.count,
              builder: (context, count) {
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
            const SizedBox(height: 40),
            const CounterCubitButton.increment(),
            const SizedBox(height: 10),
            const CounterCubitButton.decrement(),
          ],
        ),
      ),
    );
  }
}
