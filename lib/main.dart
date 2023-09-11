import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/modules/Timer/manager/bloc.dart';
import 'package:timer_app/modules/Timer/views/timer_screen.dart';

import 'core/Ticker/ticker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.dark().copyWith(secondary: const Color.fromRGBO(72, 74, 126, 1)),
      ),
      home: BlocProvider(
          create: (BuildContext context) =>TimerBloc(ticker: Ticker()),
          child: const TimerScreen()
      ) ,
    );
  }
}
