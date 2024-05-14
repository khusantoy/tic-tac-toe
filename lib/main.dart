import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
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
                          child: const Center(
                            child: Text(
                              'X',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                          child: const Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xFF015B5F),
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                          child: const Center(
                            child: Text(
                              'X',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
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
                          child: const Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xFF015B5F),
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                          child: const Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xFF015B5F),
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
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
                          child: const Center(
                            child: Text(
                              'X',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                          child: const Center(
                            child: Text(
                              'X',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                          child: const Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xFF015B5F),
                                fontSize: 80,
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
