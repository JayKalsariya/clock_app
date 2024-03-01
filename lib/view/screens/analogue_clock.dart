import 'dart:math';

import 'package:flutter/material.dart';

class AnalogueClock extends StatefulWidget {
  const AnalogueClock({super.key});

  @override
  State<AnalogueClock> createState() => _AnalogueClockState();
}

class _AnalogueClockState extends State<AnalogueClock> {
  DateTime d = DateTime.now();
  bool inPage = true;
  void animate() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      if (inPage) {
        setState(() {});
        animate();
      }
    });
  }

  @override
  void initState() {
    inPage = true;
    animate();
    super.initState();
  }

  @override
  void dispose() {
    inPage = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        title: const Text(
          'Analogue Clock',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/clock.png',
              color: Colors.white,
            ),
            // ...List.generate(
            //   60,
            //   (index) => Transform.rotate(
            //     // angle: (d.second - 15) * pi * 2 / 60,
            //     angle: index * (pi * 2) / 60,
            //     child: Divider(
            //       thickness: (index % 5 == 0) ? 5 : 2,
            //       endIndent:
            //           (index % 5 == 0) ? size.width * 0.85 : size.width * 0.9,
            //       color: (index % 5 == 0) ? Colors.red : Colors.black,
            //     ),
            //   ),
            // ),
//Hour
            Transform.rotate(
              angle: (d.hour - 3) * pi * 2 / 60,
              child: Divider(
                indent: size.width * 0.4,
                endIndent: size.width * 0.25,
                color: Colors.white,
                thickness: 5,
              ),
            ),
//Minute
            Transform.rotate(
              angle: (d.minute - 15) * pi * 2 / 60,
              child: Divider(
                indent: size.width * 0.4,
                endIndent: size.width * 0.18,
                color: Colors.white,
                thickness: 3,
              ),
            ),
//Second
            Transform.rotate(
              angle: (d.second - 15) * pi * 2 / 60,
              child: Divider(
                indent: size.width * 0.4,
                endIndent: size.width * 0.18,
                color: Colors.blue,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
