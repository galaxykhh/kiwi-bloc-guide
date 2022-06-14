import 'package:flutter/material.dart';
import 'package:kiwi_bloc_bible/presentation/counter/screen/counter_screen.dart';
import 'package:kiwi_bloc_bible/presentation/home/widget/route_button.dart';
import 'package:kiwi_bloc_bible/presentation/infinite_scroll/screen/infinite_scroll_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'home';

  static Route route() => MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('키위스튜디오 블록 교과서'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RouteButton(
              label: '카운터',
              onPressed: () => Navigator.pushNamed(context, CounterScreen.routeName),
            ),
            RouteButton(
              label: '무한스크롤',
              onPressed: () => Navigator.pushNamed(context, InfiniteScrollScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
