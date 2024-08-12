import 'package:flutter/material.dart';
import 'package:stay_jigy/data/model/level_model.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/route.dart';
import 'package:stay_jigy/shared/size/size_config.dart';
import 'package:stay_jigy/widgets/custom_circle_button.dart';
import 'package:stay_jigy/widgets/custom_round_btn.dart';

class ViewAllExercise extends StatefulWidget {
  final Levels level;
  const ViewAllExercise({Key? key, required this.level}) : super(key: key);

  @override
  _ViewAllExerciseState createState() => _ViewAllExerciseState();
}

class _ViewAllExerciseState extends State<ViewAllExercise> {
  // late int editSecond, stableValue;
  int editSecond = 5;

  @override
  void initState() {
    // editSecond = stableValue = int.parse(widget.level.exercise[0].time);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height / 2.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.level.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomCircleButton(
              onTap: () {
                Navigator.pop(context);
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //   '/BottomNavBar',
                //   (route) => false,
                //   arguments: ScreenArguments(0, false),
                // );
              },
              imagePath: 'back.png',
            ),
            Container(
              height: height,
              width: double.infinity,
              margin: EdgeInsets.only(top: height / 3.2),
              padding: EdgeInsets.symmetric(
                vertical: 2.5 * SizeConfig.height!,
                horizontal: 2.5 * SizeConfig.height!,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4 * SizeConfig.height!),
                  topRight: Radius.circular(4 * SizeConfig.height!),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.level.title,
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 3 * SizeConfig.text!,
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/icons/gas.png',
                        height: 2.8 * SizeConfig.height!,
                        color: orange,
                      ),
                   const   SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${widget.level.kcal} Kcal',
                        style: TextStyle(
                          color: grey,
                          fontSize: 2 * SizeConfig.text!,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    const  SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/icons/time.png',
                        height: 3 * SizeConfig.height!,
                        color: blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${widget.level.time} Min',
                        style: TextStyle(
                          color: grey,
                          fontSize: 2 * SizeConfig.text!,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rest between exercises',
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 2.1 * SizeConfig.text!,
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                editSecond.toString(),
                                style: TextStyle(
                                  color: black,
                                  fontSize: 5 * SizeConfig.text!,
                                  letterSpacing: 0.9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'seconds',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 2 * SizeConfig.text!,
                                  letterSpacing: 0.9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              secondUpDownBtn(
                                  onTap: () {
                                    if (50 > editSecond) {
                                      setState(() => editSecond += 5);
                                    }
                                  },
                                  image: 'up.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              secondUpDownBtn(
                                  onTap: () {
                                    if (5 < editSecond) {
                                      setState(() => editSecond -= 5);
                                    }
                                  },
                                  image: 'down.png'),
                            ],
                          ),
                        ],
                      ),
                      CustomRoundBtn(
                        onTap: () {
                          final w = WorkoutArguments(editSecond, widget.level);
                          Navigator.of(context).pushNamed(
                            '/ReadyPage',
                            arguments: w,
                          );
                        },
                        text: 'Start Workout',
                      )
                    ],
                  ),

                  Center(
                    child: Text(
                      '${widget.level.exercise.length} Exercises',
                      style: TextStyle(
                        color: black.withOpacity(0.7),
                        letterSpacing: 0.9,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.3 * SizeConfig.text!,
                      ),
                    ),
                  ),
                  // RenderSizedOverflowBox,
                  const Divider(
                    thickness: 1,
                    color: darkBlue,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.level.exercise.length,
                      itemBuilder: (itemBuilder, index) {
                        final exer = widget.level.exercise[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/ExerciseDetailsPage',
                              arguments: exer,
                            );
                          },
                          child: Container(
                            height: 7.5 * SizeConfig.height!,
                            color: white,
                            margin:
                                EdgeInsets.only(bottom: 1 * SizeConfig.height!),
                            child: Row(
                              children: [
                                Container(
                                  height: 6 * SizeConfig.height!,
                                  width: 6 * SizeConfig.height!,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(exer.imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        1 * SizeConfig.height!),
                                    color: grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  '${exer.time}s',
                                  style: TextStyle(
                                    color: grey,
                                    letterSpacing: 0.9,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 1.9 * SizeConfig.text!,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Text(
                                    '${exer.name}',
                                    style: TextStyle(
                                      color: black.withOpacity(0.7),
                                      letterSpacing: 0.9,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 2.2 * SizeConfig.text!,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget secondUpDownBtn({required String image, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 3.5 * SizeConfig.height!,
        width: 3.5 * SizeConfig.height!,
        decoration: BoxDecoration(
          color: blue,
          boxShadow: [
            BoxShadow(
              color: blue.withOpacity(0.3),
              offset: const Offset(1, 1),
              blurRadius: 20,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            'assets/icons/$image',
            color: white,
            height: 2 * SizeConfig.height!,
          ),
        ),
      ),
    );
  }
}
