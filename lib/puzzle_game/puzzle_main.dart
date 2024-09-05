import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballapp/puzzle_game/experimentmode.dart';
import 'package:footballapp/puzzle_game/numbermode.dart';
import 'package:footballapp/puzzle_game/picselector.dart';
import 'package:footballapp/src/core/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   runApp(const PuzzleApp());
// }

class PuzzleApp extends StatefulWidget {
  const PuzzleApp({Key? key}) : super(key: key);

  @override
  State<PuzzleApp> createState() => _PuzzleAppState();
}

class _PuzzleAppState extends State<PuzzleApp> {
  final ValueNotifier<EdgeInsetsGeometry> _margin1 =
      ValueNotifier<EdgeInsetsGeometry>(
          const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0));
  final ValueNotifier<EdgeInsetsGeometry> _margin2 =
      ValueNotifier<EdgeInsetsGeometry>(
          const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0));
  late int _bestScore = -1;

  void _displayAd() {}

  @override
  void initState() {
    super.initState();
    _fetchBestScore();
  }

  Future<void> _fetchBestScore() async {
    final SharedPreferences _sp = await SharedPreferences.getInstance();
    setState(() {
      _bestScore = _sp.getInt('_bestScore') ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/images/bg.jpg"), // Replace "assets/background_image.jpg" with your image path
          fit: BoxFit.cover, // You can adjust the fit as per your requirement
        ),
      ),
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: AppColors.red,
          appBar: AppBar(
            backgroundColor: Colors.transparent,

            // backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text('SLIDE FOOTBALL PUZZLE'),
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            heroTag: 'experiment',
            onPressed: () {
              Navigator.of(context)
                  .push(MyRoute(
                      builder: (BuildContext context) =>
                          ExperimentMode(_displayAd)))
                  .then((value) {
                _fetchBestScore();
              });
            },
            icon: const Icon(CupertinoIcons.lab_flask_solid),
            label: const Text(
              'EXPERIMENTAL MODE\n(You may experience low performance)',
              textAlign: TextAlign.center,
            ),
            extendedTextStyle: const TextStyle(letterSpacing: 0.0),
          ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Expanded>[
                Expanded(
                  child: ValueListenableBuilder<EdgeInsetsGeometry>(
                    valueListenable: _margin1,
                    builder: (BuildContext context, EdgeInsetsGeometry value,
                        Widget? child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                        margin: value,
                        decoration: ShapeDecoration(
                          color: (value ==
                                  const EdgeInsets.fromLTRB(
                                      48.0, 48.0, 24.0, 48.0))
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                (value ==
                                        const EdgeInsets.fromLTRB(
                                            48.0, 48.0, 24.0, 48.0))
                                    ? 12.0
                                    : 24.0)),
                            side: BorderSide(
                                color: (value ==
                                        const EdgeInsets.fromLTRB(
                                            48.0, 48.0, 24.0, 48.0))
                                    ? Colors.white12
                                    : Colors.transparent),
                          ),
                        ),
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          onTap: () {
                            Navigator.of(context)
                                .push(MyRoute(
                                    builder: (BuildContext context) =>
                                        NumberMode(_displayAd)))
                                .then((value) {
                              _fetchBestScore();
                            });
                          },
                          onHover: (bool a) {
                            if (a) {
                              _margin2.value = const EdgeInsets.fromLTRB(
                                  24.0, 48.0, 48.0, 48.0);
                              _margin1.value =
                                  const EdgeInsets.fromLTRB(8.0, 8.0, 4.0, 8.0);
                            } else {
                              _margin2.value = const EdgeInsets.fromLTRB(
                                  8.0, 16.0, 16.0, 16.0);
                              _margin1.value = const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 8.0, 16.0);
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <AnimatedDefaultTextStyle>[
                                  AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      fontSize: (sqrt(MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              sqrt(MediaQuery.of(context)
                                                  .size
                                                  .height)) /
                                          16,
                                      letterSpacing: (value ==
                                              const EdgeInsets.fromLTRB(
                                                  8.0, 8.0, 4.0, 8.0))
                                          ? 4.0
                                          : (value ==
                                                  const EdgeInsets.fromLTRB(
                                                      48.0, 48.0, 24.0, 48.0))
                                              ? -3.0
                                              : 0.0,
                                      shadows: const <Shadow>[
                                        Shadow(
                                          color: Colors.black45,
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: const Text(
                                      'Play\nNumber\nMode',
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 12.0,
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                        'Best score: ${(_bestScore == -1) ? ('-') : _bestScore}')),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder<EdgeInsetsGeometry>(
                    valueListenable: _margin2,
                    builder: (BuildContext context, EdgeInsetsGeometry value,
                        Widget? child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                        margin: value,
                        decoration: ShapeDecoration(
                          color: (value ==
                                  const EdgeInsets.fromLTRB(
                                      24.0, 48.0, 48.0, 48.0))
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                (value ==
                                        const EdgeInsets.fromLTRB(
                                            24.0, 48.0, 48.0, 48.0))
                                    ? 12.0
                                    : 24.0)),
                            side: BorderSide(
                                color: (value ==
                                        const EdgeInsets.fromLTRB(
                                            24.0, 48.0, 48.0, 48.0))
                                    ? Colors.white12
                                    : Colors.transparent),
                          ),
                        ),
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          onTap: () => Navigator.of(context).push(MyRoute(
                              builder: (BuildContext context) =>
                                  PicSelector(_displayAd))),
                          onHover: (bool a) {
                            if (a) {
                              _margin1.value = const EdgeInsets.fromLTRB(
                                  48.0, 48.0, 24.0, 48.0);
                              _margin2.value =
                                  const EdgeInsets.fromLTRB(4.0, 8.0, 8.0, 8.0);
                            } else {
                              _margin1.value = const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 8.0, 16.0);
                              _margin2.value = const EdgeInsets.fromLTRB(
                                  8.0, 16.0, 16.0, 16.0);
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <AnimatedDefaultTextStyle>[
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOutCubic,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  fontSize:
                                      (sqrt(MediaQuery.of(context).size.width) *
                                              sqrt(MediaQuery.of(context)
                                                  .size
                                                  .height)) /
                                          16,
                                  letterSpacing: (value ==
                                          const EdgeInsets.fromLTRB(
                                              4.0, 8.0, 8.0, 8.0))
                                      ? 4.0
                                      : (value ==
                                              const EdgeInsets.fromLTRB(
                                                  24.0, 48.0, 48.0, 48.0))
                                          ? -3.0
                                          : 0.0,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      color: Colors.black45,
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'Play\nPicture\nMode',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class MyRoute extends MaterialPageRoute {
  MyRoute({dynamic builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(seconds: 1);
}
