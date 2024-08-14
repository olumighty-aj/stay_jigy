import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stay_jigy/Providers/user_provider.dart';
import 'package:stay_jigy/data/model/level_model.dart';
import 'package:stay_jigy/pages/home/widgets/main_tile.dart';
import 'package:stay_jigy/pages/home/widgets/second_tile.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/size/size_config.dart';

class HomePage extends ConsumerWidget  {
  const HomePage({super.key});

  Widget build(BuildContext context, WidgetRef ref ) {
    final userAsyncValue = ref.watch(userNotifierProvider);
    final DateTime now = DateTime.now();
    String greeting;

      if (now.hour < 12) {
      greeting = 'Good Morning';
    } else if (now.hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }
    final constraints = BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );

    SizeConfig().init(constraints, MediaQuery.of(context).orientation);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(18 * (SizeConfig.height ?? 1)),
          child: Container(
            height: 10 * (SizeConfig.height ?? 1),
            padding: EdgeInsets.only(
              top: 2 * (SizeConfig.height ?? 1),
              left: 1.5 * (SizeConfig.height ?? 1),
              bottom: 2 * (SizeConfig.height ?? 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userAsyncValue.when(
                  loading: () => Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 2 * (SizeConfig.text ?? 1),
                      letterSpacing: 1.1,
                      color: black.withOpacity(0.8),
                    ),
                  ),
                   error: (error, stack) => Text(
                    'Error loading name',
                    style: TextStyle(
                      fontSize: 2 * (SizeConfig.text ?? 1),
                      letterSpacing: 1.1,
                      color: black.withOpacity(0.8),
                    ),
                  ),
                  data: (user) => Text(
                  '$greeting, ${user?.name ?? 'User'}!',
                  style: TextStyle(
                    fontSize: 2 * (SizeConfig.text ?? 1),
                    letterSpacing: 1.1,
                    color: black.withOpacity(0.8),
                    fontWeight: FontWeight.w900
                  ),
                ),
                ),
                Text(
                  "Don't Miss the Fitness!",
                  style: TextStyle(
                    fontSize: 2 * (SizeConfig.text ?? 1),
                    letterSpacing: 1.1,
                    color: black.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 1.5 * (SizeConfig.height ?? 1),
            bottom: 3 * (SizeConfig.height ?? 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exercise',
                style: TextStyle(
                  fontSize: 2.7 * (SizeConfig.text ?? 1),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                  color: black.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 37 * (SizeConfig.height ?? 1),
                child: ListView.builder(
                    itemCount: levels.length - 1,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      return MainExerciseTile(
                        level: levels[index],
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Extra Exercise',
                style: TextStyle(
                  fontSize: 2.7 * (SizeConfig.text ?? 1),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                  color: black.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ExtraExerciseTile(
                level: levels[levels.length - 1],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
