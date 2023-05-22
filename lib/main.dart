import 'package:flutter/material.dart';
import 'package:tictactoe/screens/game.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Tic-Tac-Toe Game',home: GameScreen(),
    );
  }
}
