import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/soccer_fixture.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_values.dart';

class FixtureCard extends StatelessWidget {
  final SoccerFixture soccerFixture;
  final String? fixtureTime;

  const FixtureCard({super.key, required this.soccerFixture, this.fixtureTime});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(5),
      // elevation: AppSize.s3,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(AppPadding.p5),
      // ),
      decoration: BoxDecoration(
  color: Colors.white.withOpacity(0.5),
    borderRadius: BorderRadius.circular(10),
  ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(AppPadding.p10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTeamInfo(
              context,
              name: soccerFixture.teams.home.name,
              logo: soccerFixture.teams.home.logo,
            ),
            (soccerFixture.fixture.status.short == "NS")
                ? Expanded(
                    child: Column(
                      children: [
                        Text(
                          fixtureTime.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.deepOrange),
                        ),
                        const SizedBox(height: AppSize.s5),
                        Text(
                          soccerFixture.fixtureLeague.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColors.blueGrey,
                                  fontSize: FontSize.paragraph),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: (soccerFixture.goals.home != null &&
                            soccerFixture.goals.away != null)
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    soccerFixture.goals.home.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: AppColors.deepOrange),
                                  ),
                                  Text(
                                    ":",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: AppColors.deepOrange),
                                  ),
                                  Text(
                                    soccerFixture.goals.away.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: AppColors.deepOrange),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSize.s5),
                              Text(
                                soccerFixture.fixtureLeague.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: AppColors.blueGrey,
                                        fontSize: FontSize.paragraph),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppSize.s5),
                              if (soccerFixture.fixture.status.elapsed != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p15,
                                    vertical: AppPadding.p5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: soccerFixture.fixture.status.short !=
                                            "FT"
                                        ? AppColors.red
                                        : AppColors.blue,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Text(
                                    soccerFixture.fixture.status.short != "FT"
                                        ? "Live"
                                        : "End",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontSize: FontSize.paragraph),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          )
                        : Container(),
                  ),
            buildTeamInfo(
              context,
              name: soccerFixture.teams.away.name,
              logo: soccerFixture.teams.away.logo,
            ),
          ],
        ),
      ),
    );
  }
}

Expanded buildTeamInfo(BuildContext context,
    {required String logo, required String name}) {
  return Expanded(
    child: Column(
      children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
          height: AppSize.s45,
          width: AppSize.s45,
          imageUrl: logo,
        ),
        //  CircleAvatar(
        //     backgroundColor: Colors.white,
        //     child: Text(
        //       name.substring(0, 1),
        //       style: TextStyle(color: Colors.green),
        //     ),
        //   ),
        const SizedBox(height: AppSize.s10),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeights.medium, fontSize: FontSize.details),
        ),
      ],
    ),
  );
}
