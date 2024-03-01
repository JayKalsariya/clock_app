import 'package:flutter/material.dart';
import 'package:new_clock_app/utils/routes.dart';
import 'package:new_clock_app/view/screens/analogue_clock.dart';
import 'package:new_clock_app/view/screens/dummy.dart';
import 'package:new_clock_app/view/screens/stop_watch.dart';
import 'package:new_clock_app/view/screens/timer.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black54),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.digitalClock: (context) => const HomePage(),
        Routes.analogueClock: (context) => const AnalogueClock(),
        Routes.stopWatch: (context) => const StopWatch(),
        Routes.timer: (context) => const Timer2(),
      },
    );
  }
}
