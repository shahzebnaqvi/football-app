import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballapp/puzzle_game/puzzle_main.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../game/tiktactohome.dart';
import '../cubit/soccer_cubit.dart';
import '../cubit/soccer_state.dart';

class SoccerLayout extends StatelessWidget {
  const SoccerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoccerCubit, SoccerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SoccerCubit cubit = context.read<SoccerCubit>();
        return Scaffold(
          appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: TextStyle(color: AppColors.red),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TictactoIntroScreen()),
                      );
                    },
                    icon: Icon(Icons.gamepad)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PuzzleApp()),
                      );
                    },
                    icon: Icon(Icons.pie_chart_sharp)),
              ]),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  opacity: 0.2, // Replace with the path to your image file
                  fit: BoxFit.cover,
                ),
                
              ),
              child: cubit.screens[cubit.currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: AppColors.red,
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              if (index == 1) {
                cubit.currentFixtures = cubit.dayFixtures;
              }
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: AppStrings.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer_rounded),
                label: AppStrings.fixtures,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: AppStrings.standings,
              ),
              //  BottomNavigationBarItem(
              //   icon: Icon(Icons.bar_chart),
              //   label: "aa"
              //   // AppStrings.liveScore,
              // ),
            ],
          ),
        );
      },
    );
  }
}
