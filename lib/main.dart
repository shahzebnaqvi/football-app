import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballapp/puzzle_game/puzzle_main.dart';

import 'bloc_observer.dart';
import 'src/container_injector.dart';
import 'src/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initApp();
  Bloc.observer = MyBlocObserver();
  // runApp(const MyApp());

SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_) {
runApp(
  MyApp
  // PuzzleApp
  ());
});
}
