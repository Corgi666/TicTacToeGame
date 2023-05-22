import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/constans/color.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resultDeclaration = '';
  bool winnerFound = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player O',
                          style: AppColor.customFontWhite,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Player X',
                          style: AppColor.customFontWhite,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          oScore.toString(),
                          style: AppColor.customFontWhite,
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Text(
                          xScore.toString(),
                          style: AppColor.customFontWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                        _checkWiner();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 5, color: AppColor.PrimaryColor),
                            color: AppColor.SecondaryColr),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                                fontSize: 54, color: AppColor.PrimaryColor),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Text(
                resultDeclaration.toString(),
                style: AppColor.customFontWhite,
              ),
              flex: 2,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _Reset();
        },
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn==true && displayXO[index] == '') {
        displayXO[index] = 'O';
        oTurn = false;
        // filledBoxes++;
      } else if (oTurn==false && displayXO[index] == 'O') {
        displayXO[index] = 'O';
        // oTurn = false;
        // filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        oTurn = true;
        // filledBoxes++;
      } else if (!oTurn && displayXO[index] == 'X') {
        displayXO[index] = 'X';
        // oTurn = false;
        // filledBoxes++;
      }
    });
    if (oTurn == true) {
      print('o');
    } else if (oTurn == false) {
      print('X');
    }
  }

  void _checkWiner() {
    //1st Row Check
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[0] + 'Winer';
        _updateScore(displayXO[0]);
      });
    }
    //2nd Row Check
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[3] + 'Winer';
        _updateScore(displayXO[3]);
      });
    } //3rd check
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[0] + 'Winer';
        _updateScore(displayXO[6]);
      });
    }
    //1st Column Check
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[0] + 'Winer';
        _updateScore(displayXO[0]);
      });
    } //2nd Column Check
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[1] + 'Winer';
        _updateScore(displayXO[1]);
      });
    } //3rd Column Check
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[2] + 'Winer';
        _updateScore(displayXO[2]);
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[0] + 'Winer';
        _updateScore(displayXO[0]);
      });
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player' + displayXO[2] + 'Winer';
        _updateScore(displayXO[2]);
      });
    }
    if (filledBoxes == 9 && !winnerFound) {
      setState(() {
     //   resultDeclaration = 'Nobody Win!';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _Reset() {
    for (var i =0 ; i < 9; i++) {
      displayXO[i] = '';
    }
  }
}
