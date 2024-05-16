import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<List<String>> currentState = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
  ];

  List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  bool win = false;

  int personScore = 0;
  int robotScore = 0;
  int steps = 0;

  bool run = true;

  void restart() {
    currentState = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];

    setState(() {});

    personScore = 0;
    robotScore = 0;
    steps = 0;
  }

  void newGame() {
    currentState = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];
    steps = 0;
    setState(() {});
  }

  String winner = '';

  void check() {
    if (currentState[0][0] == currentState[1][1] &&
        currentState[1][1] == currentState[2][2]) {
      win = true;
      winner = currentState[0][0];
    } else if (currentState[0][2] == currentState[1][1] &&
        currentState[1][1] == currentState[2][0]) {
      win = true;
      winner = currentState[0][2];
    } else if (currentState[0][0] == currentState[0][1] &&
        currentState[0][1] == currentState[0][2]) {
      win = true;
      winner = currentState[0][0];
    } else if (currentState[1][0] == currentState[1][1] &&
        currentState[1][1] == currentState[1][2]) {
      win = true;
      winner = currentState[1][0];
    } else if (currentState[2][0] == currentState[2][1] &&
        currentState[2][1] == currentState[2][2]) {
      win = true;
      winner = currentState[2][0];
    } else if (currentState[0][0] == currentState[1][0] &&
        currentState[1][0] == currentState[2][0]) {
      win = true;
      winner = currentState[0][0];
    } else if (currentState[0][1] == currentState[1][1] &&
        currentState[1][1] == currentState[2][1]) {
      win = true;
      winner = currentState[0][1];
    } else if (currentState[0][2] == currentState[1][2] &&
        currentState[1][2] == currentState[2][2]) {
      win = true;
      winner = currentState[0][2];
    }

    if (win) {
      run == false;
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("$winner is Winner"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          });

      if (winner == 'X') {
        personScore++;
      } else {
        robotScore++;
      }
      steps = 0;
      win = !win;
    }
  }

  void move() {
    steps++;

    if (steps == 9 && win == false) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Draw"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          });
    }
  }

  void robot() {
    while (true && steps != 9) {
      int randNumber1 = Random().nextInt(3);
      int randNumber2 = Random().nextInt(3);

      if (numbers.any((number) => currentState[0].contains(number)) ||
          numbers.any((number) => currentState[1].contains(number)) ||
          numbers.any((number) => currentState[2].contains(number))) {
        if (numbers.contains(currentState[randNumber1][randNumber2])) {
          setState(() {
            move();
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
    return Scaffold(
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
                      Text(
                        "$personScore : $robotScore",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                        ),
                      ),
                      const Positioned(
                        left: 8,
                        top: -15,
                        child: Text(
                          "🧑‍🦰",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 112,
                        top: -15,
                        child: const Text(
                          "🤖",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Starts game: ',
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
                          if (currentState[0][0] == '1') {
                            currentState[0][0] = 'X';
                            run == true;
                            check();
                            robot();
                            move();
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
                                color: numbers.contains(currentState[0][0])
                                    ? Colors.transparent
                                    : currentState[0][0] == 'X'
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
                          if (currentState[1][0] == '4') {
                            currentState[1][0] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[1][0])
                                    ? Colors.transparent
                                    : currentState[1][0] == 'X'
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
                          if (currentState[2][0] == '7') {
                            currentState[2][0] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[2][0])
                                    ? Colors.transparent
                                    : currentState[2][0] == 'X'
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
                          if (currentState[0][1] == '2') {
                            currentState[0][1] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[0][1])
                                    ? Colors.transparent
                                    : currentState[0][1] == 'X'
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
                          if (currentState[1][1] == '5') {
                            currentState[1][1] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[1][1])
                                    ? Colors.transparent
                                    : currentState[1][1] == 'X'
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
                          if (currentState[2][1] == '8') {
                            currentState[2][1] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[2][1])
                                    ? Colors.transparent
                                    : currentState[2][1] == 'X'
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
                          if (currentState[0][2] == '3') {
                            currentState[0][2] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[0][2])
                                    ? Colors.transparent
                                    : currentState[0][2] == 'X'
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
                          if (currentState[1][2] == '6') {
                            currentState[1][2] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[1][2])
                                    ? Colors.transparent
                                    : currentState[1][2] == 'X'
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
                          if (currentState[2][2] == '9') {
                            currentState[2][2] = 'X';
                            run == true;
                            robot();
                            check();
                            move();
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
                                color: numbers.contains(currentState[2][2])
                                    ? Colors.transparent
                                    : currentState[2][2] == 'X'
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
                      onPressed: newGame,
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
                      onPressed: restart,
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
    );
  }
}
