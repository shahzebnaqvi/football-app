import 'package:flutter/material.dart';
import 'package:footballapp/puzzle_game/puzzle_main.dart';
import 'package:footballapp/src/config/app_route.dart';
import 'package:footballapp/src/core/utils/app_colors.dart';
import 'package:footballapp/src/features/game/tiktactohome.dart';
import 'package:footballapp/src/features/soccer/presentation/screens/onboarding.dart';

class HomePageSelection extends StatefulWidget {
  static var myNewFont = TextStyle(color: AppColors.red, letterSpacing: 3);

  @override
  State<HomePageSelection> createState() => _HomePageSelectionState();
}

class _HomePageSelectionState extends State<HomePageSelection> {
  // Routes.onBoarding,

  void _checkCurrentDate() {
    DateTime currentDate = DateTime.now();
    DateTime targetDate = DateTime(2024, 4, 8);
    if (true
      // currentDate.isAfter(targetDate)
      ) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingAnimationExample()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2), () {
      _checkCurrentDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.red,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('HOME'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            opacity: 0.6, // Replace with the path to your image file
            fit: BoxFit.cover,
          )),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200, // Adjust width as per your requirement
                    height: 200, // Adjust height as per your requirement
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(
                          10), // Adjust border radius as per your requirement
                    ),
                    child: Image.asset(
                      'assets/images/ic_launcher.png', // Replace 'assets/images/ic_launcher.png' with your image asset path
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PuzzleApp()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              'PLAY FOOTBALL PUZZEL',
                              style: HomePageSelection.myNewFont,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TictactoIntroScreen()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              'PLAY TIC TAC TOE',
                              style: HomePageSelection.myNewFont,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
