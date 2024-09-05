import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import '../../../../config/app_route.dart';

class OnBoardingAnimationExample extends StatefulWidget {
  const OnBoardingAnimationExample({Key? key}) : super(key: key);

  @override
  State<OnBoardingAnimationExample> createState() =>
      _OnBoardingAnimationExampleState();
}

class _OnBoardingAnimationExampleState
    extends State<OnBoardingAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c9e3c),
      // backgroundColor: Colors.white.withOpacity(.9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OnBoardingAnimation(
          controller: PageController(initialPage: 1),
          pages: const [
            _GetCardsContent(
              image: 'assets/images/f1.png',
              cardContentheading: "Dynamic Kickoff",
              cardContent:
                  'Feel the Roar, Live the Score: Where Every Kick Counts!',
            ),
            _GetCardsContent(
              image: 'assets/images/f2.png',
              cardContentheading: "Soccer Spectacle",
              cardContent:
                  'Soccer Unleashed: Your Front Row Seat to the Beautiful Game LIVE!',
            ),
            _GetCardsContent(
              image: 'assets/images/f3.png',
              cardContentheading: "Thrilling Touchdown",
              cardContent:
                  'Kick off the Excitement: Experience Football Thrills in Real-Time!',
            ),
          ],
          indicatorDotHeight: 7.0,
          indicatorDotWidth: 7.0,
          indicatorType: IndicatorType.expandingDots,
          indicatorPosition: IndicatorPosition.bottomCenter,
          indicatorSwapType: SwapType.normal,
        ),
      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {
  final String image, cardContent, cardContentheading;

  const _GetCardsContent({
    Key? key,
    this.image = '',
    this.cardContent = '',
    this.cardContentheading = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
              'assets/images/bg.png'), // Replace with the path to your image file
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        // decoration: ColorConstraints.myGradientDecoration,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg.png'), // Replace with the path to your image file
            fit: BoxFit.cover,
          ),
          gradient: RadialGradient(colors: [
            Colors.grey.withOpacity(0.4),
            Color(0xffffffff),
          ]),
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Image.asset(image),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  cardContentheading,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: Color(0xff1c9e3c),),
                ),
                Text(
                  cardContent,textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1c9e3c),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.soccerLayout);
                  },
                  child:
                      Text("Continue", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
