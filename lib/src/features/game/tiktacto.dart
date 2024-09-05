import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class TiktactoHomePage extends StatefulWidget {
  @override
  _TiktactoHomePageState createState() => _TiktactoHomePageState();
}

class _TiktactoHomePageState extends State<TiktactoHomePage> {
  List<String> displayExOh = [
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

  bool ohTurn = true; // the first player is O!
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFont = TextStyle(color: AppColors.red, letterSpacing: 3);
  static var myNewFontWhite =
      TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/backimg.gif",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "TIk TIK Out Game",
            // style: TextStyle(color: AppColors.white)
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: AppColors.red.withOpacity(0.8),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/bg.jpg",
              ), // Replace "assets/background_image.jpg" with your image path
              fit: BoxFit
                  .cover, // You can adjust the fit as per your requirement
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),
                  BlendMode.dstATop), // Adjust opacity here
            ),
          ),
          child: Container(
            child: SafeArea(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 55,
                      ),
                      Expanded(
                        flex: 3,
                        child: GridView.builder(
                            itemCount: 9,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  _tapped(index);
                                },
                                child: Container(
                                  // margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width:
                                          3, //                   <--- border width here
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      displayExOh[index],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Player ⚽',
                                      style: myNewFontWhite,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      ohScore.toString(),
                                      style: myNewFontWhite,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Player 🥅',
                                      style: myNewFontWhite,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      exScore.toString(),
                                      style: myNewFontWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'TIC TAC TOE',
                        style: myNewFontWhite,
                      ),
                      // Expanded(
                      //   child: Container(
                      //     child: Center(
                      //       child: Column(
                      //         children: <Widget>[

                      //           // SizedBox(
                      //           //   height: 60,
                      //           // ),
                      //           // Text(
                      //           //   'Spod.pk',
                      //           //   style: myNewFontWhite,
                      //           // ),
                      //           // Image.asset(
                      //           //   'assets/images/white-logo.png',
                      //           //   width: 180,
                      //           //   // fit: BoxFit.scaleDown,
                      //           // ),
                      //           // Container(
                      //           //   child: Image.asset(
                      //           //     'assets/images/white-logo.png',
                      //           //     color: Colors.white,
                      //           //     // fit: BoxFit.scaleDown,
                      //           //   ),
                      //           // ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = '🥅';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = '⚽';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    // checks diagonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  AppColors.red.withOpacity(0.8),
                )),
                child: Text('Play Again!'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + winner),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  AppColors.red.withOpacity(0.8),
                )),
                child: Text('Play Again!'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
