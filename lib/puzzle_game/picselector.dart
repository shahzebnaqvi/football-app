import 'dart:math';
import 'package:flutter/material.dart';
import 'package:footballapp/puzzle_game/picturemode.dart';
import 'package:footballapp/src/core/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRoute extends MaterialPageRoute {
  MyRoute({dynamic builder}) : super(builder: builder);
  @override
  Duration get transitionDuration => const Duration(seconds: 1);
}

class PicSelector extends StatefulWidget {
  const PicSelector(this._displayAd, {Key? key}) : super(key: key);
  final Function _displayAd;
  @override
  _PicSelectorState createState() => _PicSelectorState();
}

class _PicSelectorState extends State<PicSelector> {
  late SharedPreferences _sp;
  List<int> _bestScores = [-1, -1, -1, -1];

  Future<void> _fetch() async {
    _sp = await SharedPreferences.getInstance();
    for (int i = 0; i < 4; i++) {
      if (_sp.getInt('_pic${(i + 1)}BestScore') != null) {
        setState(() {
          _bestScores[i] = _sp.getInt('_pic${(i + 1)}BestScore')!;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text('Select a picture'),
        centerTitle: true,
      ),
      body: Container(  decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/bg.jpg",), // Replace "assets/background_image.jpg" with your image path
            fit: BoxFit.cover, // You can adjust the fit as per your requirement      
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop), // Adjust opacity here

          ),
        ),
        child: Center(
          child: SizedBox(
            width: (sqrt(MediaQuery.of(context).size.width) * sqrt(MediaQuery.of(context).size.height)) * 0.8,
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: (sqrt(MediaQuery.of(context).size.width) * sqrt(MediaQuery.of(context).size.height)) / 24),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: (sqrt(MediaQuery.of(context).size.width) * sqrt(MediaQuery.of(context).size.height)) / 48,
              mainAxisSpacing: (sqrt(MediaQuery.of(context).size.width) * sqrt(MediaQuery.of(context).size.height)) / 48,
              children: List.generate(4, (index) {
                final int pictureIndex = index + 1;
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).push(MyRoute(builder: (BuildContext context) => PictureMode(pictureIndex, widget._displayAd))).then((value) {
                      _fetch();
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: '$pictureIndex',
                        createRectTween: (Rect? begin, Rect? end) {
                          return MaterialRectCenterArcTween(begin: begin, end: end);
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                          child: Image.asset(
                            'assets/$pictureIndex/original.jpg',
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Container(
                            color: Colors.black38,
                            child: Text(
                              'Best score: ${_bestScores[index] == -1 ? '-' : _bestScores[index]}',
                              style: TextStyle(
                                fontSize: (sqrt(MediaQuery.of(context).size.width) * sqrt(MediaQuery.of(context).size.height)) / 24,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
