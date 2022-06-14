import 'package:flutter/material.dart';
import 'package:kiwi_bloc_bible/core/routes/app_router.dart';
import 'package:kiwi_bloc_bible/presentation/home/screen/home_sceen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '키위 블록 교과서',
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF1CBF94)),
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
