import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int sec = 0;
  int min = 0;
  int hour = 0;
  String digitSecond = "00";
  String digitMinute = "00";
  String digitHour = "00";

  Timer? timer;
  bool started = false;

  List laps = [];
//Stop Process
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

//Reset Process
  void reset() {
    timer!.cancel();
    setState(() {
      sec = 0;
      min = 0;
      hour = 0;

      digitSecond = "00";
      digitMinute = "00";
      digitHour = "00";

      started = false;
    });
  }

//Lap Process
  void addLaps() {
    String lap = "$digitHour:$digitMinute:$digitSecond";
    setState(() {
      laps.add(lap);
    });
  }

//Start Process
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      sec++;
      if (sec > 59) {
        if (min > 59) {
          hour++;
          min = 0;
        } else {
          min++;
          sec = 0;
        }
      }
      setState(() {
        min = min;
        hour = hour;

        digitSecond = (sec >= 10) ? "$sec" : "0$sec";
        digitHour = (sec >= 10) ? "$hour" : "0$hour";
        digitMinute = (min >= 10) ? "$min" : "0$min";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        title: const Text(
          'Stop Watch',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
//Part 1
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
//Time
                      Text(
                        "$digitHour : $digitMinute : $digitSecond",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 56,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
//Start / Pause  Button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                (!started) ? start() : stop();
                              });
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.shade600,
                                // color: Color(0xff0b2a11),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                (!started) ? "Start" : "Pause",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
//Lap Icon
                          IconButton(
                            onPressed: () {
                              addLaps();
                            },
                            icon: const Icon(
                              Icons.flag,
                              color: Colors.white,
                            ),
                          ),
//Reset Button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                reset();
                                laps.clear();
                              });
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xff1c1c1e),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Reset",
                                style: TextStyle(
                                  color: Color(0xff99989d),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
//Part 2
              Expanded(
                child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lap ${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            " ${laps[index]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
