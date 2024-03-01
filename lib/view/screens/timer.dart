import 'dart:math';
import 'package:flutter/material.dart';

class Timer2 extends StatefulWidget {
  const Timer2({super.key});

  @override
  State<Timer2> createState() => _Timer2State();
}

class _Timer2State extends State<Timer2> {
  int s = 0;
  int m = 0;
  bool canRun = true;

  startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        s--;
        if (s < 0) {
          m--;
          s = 59;
        }
        if (m == 0 && s == 0) {
          canRun = false;
        }
        if (canRun) {
          startTimer();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        title: const Text(
          'Timer',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "$m : $s",
                      style: const TextStyle(
                        fontSize: 55,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Transform.scale(
                      scale: 7.5,
                      child: CircularProgressIndicator(
                        value: s / 60,
                        color: Colors.teal,
                        strokeWidth: 1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
//Minute
                    Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListWheelScrollView(
                        itemExtent: 30,
                        useMagnifier: true,
                        magnification: 1.2,
                        diameterRatio: 0.5,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            m = index;
                            log(m);
                          });
                        },
                        children: List.generate(
                          60,
                          (index) => Text(
                            "$index",
                            style: const TextStyle(
                                fontSize: 25, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
//Second
                    Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListWheelScrollView(
                        itemExtent: 30,
                        useMagnifier: true,
                        magnification: 1.2,
                        diameterRatio: 0.5,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            s = index;
                          });
                        },
                        children: List.generate(
                          60,
                          (index) => Text(
                            "$index",
                            style: const TextStyle(
                                fontSize: 25, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//Start Button
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  height: 55,
                  width: 170,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        startTimer();
                      });
                    },
                    child: Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
