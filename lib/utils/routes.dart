import 'package:flutter/material.dart';

class Routes {
  static String digitalClock = '/';
  static String analogueClock = 'AnalogueClock';
  static String stopWatch = 'StopWatch';
  static String timer = 'Timer';
}

int currentIndex = 0;

late PageController pageController;
