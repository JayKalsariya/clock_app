import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_clock_app/view/screens/digital_clock.dart';
import 'package:new_clock_app/view/screens/stop_watch.dart';
import 'package:new_clock_app/view/screens/timer.dart';

import '../../utils/routes.dart';
import 'analogue_clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          DigitalClock(),
          AnalogueClock(),
          StopWatch(),
          Timer2(),
        ],
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black54,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  selectedIndex = 0;
                  pageController.animateTo(0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                  setState(() {});
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.watch,
                      color: (selectedIndex == 0) ? Colors.blue : Colors.white,
                    ),
                    const Text(
                      "Digital",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedIndex = 1;
                  pageController.animateTo(1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                  setState(() {});
                },
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.clock,
                      color: (selectedIndex == 1) ? Colors.blue : Colors.white,
                    ),
                    const Text(
                      "Analogue",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedIndex = 2;
                  pageController.animateTo(2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                  setState(() {});
                },
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.stopwatch_fill,
                      color: (selectedIndex == 2) ? Colors.blue : Colors.white,
                    ),
                    const Text(
                      "Stop Watch",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedIndex = 3;
                  pageController.animateTo(3,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                  setState(() {});
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.timelapse_rounded,
                      color: (selectedIndex == 3) ? Colors.blue : Colors.white,
                    ),
                    const Text(
                      "Timer",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
