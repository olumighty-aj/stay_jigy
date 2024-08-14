
import 'package:flutter/material.dart';
import 'package:stay_jigy/data/model/exercise_model.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/size/size_config.dart';
import 'package:stay_jigy/widgets/custom_circle_button.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final Exercise exercise;
  const ExerciseDetailsPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          exercise.name,
          style: TextStyle(
            color: black.withOpacity(0.7),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 65,
        leading: CustomCircleButton(
          onTap: () {
            Navigator.pop(context);
          },
          imagePath: 'back.png',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2 * SizeConfig.height!),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  exercise.imagePath,
                  height: 40 * SizeConfig.height!,
                  fit: BoxFit.fill,
                ),
              ),
             const SizedBox(height: 20,),
              for (int i = 0; exercise.steps.length > i; i++)
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2 * SizeConfig.height!,
                    horizontal: 1 * SizeConfig.height!,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 2.5 * SizeConfig.height!,
                        backgroundColor: blue,
                        child:  Text(
                          '${i + 1}',
                          style: TextStyle(
                            color: white,
                            fontSize: 2.6 * SizeConfig.text!,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    const  SizedBox(width: 20,),

                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 32 * SizeConfig.height!,
                        
                        decoration: BoxDecoration(
                          color: blue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:  Text(
                            exercise.steps[i],
                            style: TextStyle(
                              color: black.withOpacity(0.9),
                              letterSpacing: 1,
                              fontSize: 2 * SizeConfig.text!,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
