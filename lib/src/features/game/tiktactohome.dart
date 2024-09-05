import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballapp/src/core/utils/app_colors.dart';
import 'package:footballapp/src/features/game/tiktacto.dart';

class TictactoIntroScreen extends StatefulWidget {
  @override
  _TictactoIntroScreenState createState() => _TictactoIntroScreenState();
}

class _TictactoIntroScreenState extends State<TictactoIntroScreen>
    with SingleTickerProviderStateMixin {
  static var myNewFont = TextStyle(color: AppColors.red, letterSpacing: 3);
  static var myNewFontWhite = TextStyle(color: Colors.white, letterSpacing: 3);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          opacity: 0.2, // Replace with the path to your image file
          fit: BoxFit.cover,
        ),
        gradient: RadialGradient(colors: [
          AppColors.red.withOpacity(0.2),
          Color(0xffffffff),
        ]),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Tik Football Game",
              // style: TextStyle(color: AppColors.white),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: AppColors.red.withOpacity(0.8),
          body: Container(decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/bg.jpg",), // Replace "assets/background_image.jpg" with your image path
            fit: BoxFit.cover, // You can adjust the fit as per your requirement      
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6 ), BlendMode.dstATop), // Adjust opacity here

          ),
        ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        child: Text(
                          "TIC TAC TOE",
                          style: myNewFontWhite.copyWith(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      // child: Image.asset(
                      //   'assets/images/white-logo.png',
                      //   width: 200,
                      //   // fit: BoxFit.scaleDown,
                      // ),
                      // Container(
                      //   child: Text(
                      //     "@CREATEDBYMITCH",
                      //     style: myNewFontWhite.copyWith(fontSize: 20),
                      //   ),
                      // ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TiktactoHomePage()),
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
                              'PLAY GAME',
                              style: myNewFont,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
