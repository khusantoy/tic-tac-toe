import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<List<String>> currentState = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  void robot() {
    while (true) {
      int randNumber1 = Random().nextInt(3);
      int randNumber2 = Random().nextInt(3);

      if (currentState[0].contains('') ||
          currentState[1].contains('') ||
          currentState[2].contains('')) {
        if (currentState[randNumber1][randNumber2] == '') {
          setState(() {
            currentState[randNumber1][randNumber2] = '0';
          });
          break;
        }
      } else {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF5A9B9B),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //! column 1
                Column(
                  children: [
                    Text(
                      "." * 30,
                      style: const TextStyle(
                        color: Color(0xFFDDB785),
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 20,
                          left: -20,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 255, 185, 95),
                            ),
                          ),
                        ),
                        const Text(
                          "0 : 0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Start game: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: "X",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (currentState[0][0] == '') {
                              currentState[0][0] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                                bottom: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[0][0],
                                style: TextStyle(
                                  color: currentState[0][0] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (currentState[1][0] == '') {
                              currentState[1][0] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                                bottom: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[1][0],
                                style: TextStyle(
                                  color: currentState[1][0] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (currentState[2][0] == '') {
                              currentState[2][0] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[2][0],
                                style: TextStyle(
                                  color: currentState[2][0] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //! column 2
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (currentState[0][1] == '') {
                              currentState[0][1] = 'X';

                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[0][1],
                                style: TextStyle(
                                  color: currentState[0][1] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (currentState[1][1] == '') {
                              currentState[1][1] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[1][1],
                                style: TextStyle(
                                  color: currentState[1][1] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (currentState[2][1] == '') {
                              currentState[2][1] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                currentState[2][1],
                                style: TextStyle(
                                  color: currentState[2][1] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //! column 3
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (currentState[0][2] == '') {
                              currentState[0][2] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                                bottom: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[0][2],
                                style: TextStyle(
                                  color: currentState[0][2] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (currentState[1][2] == '') {
                              currentState[1][2] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                                bottom: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[1][2],
                                style: TextStyle(
                                  color: currentState[1][2] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (currentState[2][2] == '') {
                              currentState[2][2] = 'X';
                              robot();
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: Color(0xFFDDB785),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                currentState[2][2],
                                style: TextStyle(
                                  color: currentState[2][2] == 'X'
                                      ? Colors.white
                                      : const Color(0xFF015B5F),
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF008287),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'new game'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF008287),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'reset game'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
