import 'package:flutter/material.dart';

class Timer2 extends StatefulWidget {
  const Timer2({super.key});

  @override
  State<Timer2> createState() => _Timer2State();
}

class _Timer2State extends State<Timer2> {
  int s = 0;
  int m = 0;

  startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        s--;
        if (s < 0) {
          m--;
          s = 59;
        }

        if (m == 0 && s == 0) {
          s == 0;
          m == 0;
          // MinCon.clear();
          // SecCon.clear();
          Navigator.pushNamed(context, 'result_screen');
        }

        startTimer();
      });
    });
  }

  TextEditingController minCon = TextEditingController();
  TextEditingController secCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    // Transform.scale(
                    //   scale: 7.5,
                    //   child: CircularProgressIndicator(
                    //     value: (m * 60) + s.toDouble(),
                    //     color: Colors.teal,
                    //     strokeWidth: 1,
                    //   ),
                    // )
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
                    SizedBox(
                      width: 150,
                      height: 75,
                      child: TextField(
                        controller: minCon,
                        onChanged: (val) {
                          setState(() {
                            m = int.parse(val);
                          });
                        },
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color(0xcc7c7c7c),
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Minutes",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                        maxLength: 1,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 75,
                      child: TextField(
                        controller: secCon,
                        onChanged: (val) {
                          setState(() {
                            s = int.parse(val);
                          });
                        },
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color(0xcc7c7c7c),
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Seconds",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 2,
                            ),
                          ),
                        ),
                        maxLength: 2,
                      ),
                    ),
                  ],
                ),
              ),
              //Start Button
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  height: 80,
                  width: 180,
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
                        fontSize: 20,
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
