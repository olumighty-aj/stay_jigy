import 'package:flutter/material.dart';
import 'package:stay_jigy/data/model/level_model.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/size/size_config.dart';

class ExtraExerciseTile extends StatelessWidget {
  final Levels level;
  const ExtraExerciseTile({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    
     final constraints = BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );

     SizeConfig().init(constraints, MediaQuery.of(context).orientation);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/ViewAllExercisePage',
          arguments: level,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(level.imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: blueShadow.withOpacity(0.5),
              offset: const Offset(5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 16 * SizeConfig.height!,
              width: 25 * SizeConfig.height!,
              padding: EdgeInsets.symmetric(horizontal: 1 * SizeConfig.height!),
              decoration: BoxDecoration(
                color: black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  level.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontSize: 2.8 * (SizeConfig.text ?? 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
