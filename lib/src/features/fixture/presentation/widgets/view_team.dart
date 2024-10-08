import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/teams.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';

class ViewTeam extends StatelessWidget {
  final Team team;

  const ViewTeam({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: AppSize.s35,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: AppSize.s50,
            height: AppSize.s50,
            imageUrl: team.logo,
          ),
        ),
        //  CircleAvatar(
        //     backgroundColor: Colors.white,
        //     child: Text(
        //       team.name.substring(0, 1),
        //       style: TextStyle(color: Colors.green),
        //     ),
        //   ),
        const SizedBox(height: AppSize.s10),
        FittedBox(
          child: Text(
            team.name.split(" ").length >= 3
                ? team.name.split(" ").sublist(0, 2).join(" ")
                : team.name,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
