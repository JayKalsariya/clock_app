import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';
import '../components/timebox.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime d2 = DateTime.now();
  void animate2() {
    Future.delayed(const Duration(seconds: 1), () {
      d2 = DateTime.now();
      setState(() {});
      animate2();
    });
  }

  @override
  void initState() {
    super.initState();
    animate2();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        title: const Text(
          'Digital Clock',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        // margin: const EdgeInsetsDirectional.all(16),
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.04,
            ),
            timeBox(timeFormat: (d2.hour) % 12),
            const Text(
              ":",
              style: TextStyle(color: Colors.blue, fontSize: 50),
            ),
            timeBox(timeFormat: d2.minute),
            const Text(
              ":",
              style: TextStyle(color: Colors.blue, fontSize: 50),
            ),
            timeBox(timeFormat: d2.second),
          ],
        ),
      ),
    );
  }
}
