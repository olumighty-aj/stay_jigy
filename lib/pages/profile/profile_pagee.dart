import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stay_jigy/Providers/user_provider.dart';
import 'package:stay_jigy/data/database/app_db.dart';
import 'package:stay_jigy/pages/home/widgets/dialog_box.dart';
import 'package:stay_jigy/pages/profile/widgets/dob_picker.dart';
import 'package:stay_jigy/pages/profile/widgets/gender_picker.dart';
import 'package:stay_jigy/pages/profile/widgets/height_picker.dart';
import 'package:stay_jigy/pages/profile/widgets/name_picker.dart';
import 'package:stay_jigy/pages/profile/widgets/weight_picker.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/size/size_config.dart';
import 'package:stay_jigy/widgets/custom_round_btn.dart';
import 'package:stay_jigy/widgets/warning_dialog_box.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userNotifierProvider);

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: black.withOpacity(0.7),
            fontSize: 3 * SizeConfig.text!,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: userAsyncValue.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (user) {
            if(user == null){
              return const Center(child: Text('No User Avaliable'));
            }
             final bmiValue = user.bmi != null ? double.tryParse(user.bmi!) ?? 0.0 : 0.0;
          final level = ref.read(userNotifierProvider.notifier).getBMILevel(bmiValue);
          final bmiData = ref.read(userNotifierProvider.notifier).getBMIData(bmiValue);
            return SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.2 * SizeConfig.height!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    settingsTile(
                      'Name',
                      'name',
                      user!.name?.isNotEmpty == true ? user.name! : '0.0',
                      () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return NamePicker(
                                getName: (p0) {
                                  ref
                                      .read(userNotifierProvider.notifier)
                                      .updateUser('name', p0);
                                },
                                name: user.name ?? '',
                              );
                            });
                      },
                    ),
                    settingsTile(
                      'Gender',
                      'gender',
                      user.gender?.isNotEmpty == true ? user.gender! : '0.0',
                      () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return GenderPicker(
                                gender: (p0) {
                                  ref
                                      .read(userNotifierProvider.notifier)
                                      .updateUser('gender', p0);
                                },
                              );
                            });
                      },
                    ),
                    settingsTile(
                      'Height',
                      'height',
                      user.height?.isNotEmpty == true
                          ? '${user.height} cm'
                          : '0.0',
                      () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return HeightPicker(
                                height: (p0) {
                                  ref
                                      .read(userNotifierProvider.notifier)
                                      .updateUser('height', p0);
                                },
                                initialValue: user.height ?? '',
                              );
                            });
                      },
                    ),
                    settingsTile(
                      'Weight',
                      'weight',
                      user.weight?.isNotEmpty == true
                          ? '${user.weight} kg'
                          : '0.0',
                      () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return WeightPicker(
                                weight: (p0) {
                                  ref
                                      .read(userNotifierProvider.notifier)
                                      .updateUser('weight', p0);
                                },
                              );
                            });
                      },
                    ),
                    settingsTile(
                      'Date of birth',
                      'birthday',
                      user.birth?.isNotEmpty == true ? user.birth! : '0.0',
                      () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return DOBPicker(
                                dob: (p0) {
                                  ref
                                      .read(userNotifierProvider.notifier)
                                      .updateUser('birth', p0);
                                },
                              );
                            });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 9 * SizeConfig.height!,
                        vertical: 2.5 * SizeConfig.height!,
                      ),
                      child: CustomRoundBtn(
                        onTap: () {
                          if (user.height?.isNotEmpty == true &&
                              user.weight?.isNotEmpty == true) {
                            ref
                                .read(userNotifierProvider.notifier)
                                .calculateBMI();
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialogBox(
                                    title:
                                        'Please enter your weight and height it must necessarily be used for calculating.',
                                  );
                                });
                          }
                        },
                        text: 'Calculate',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'BMI(kg/m2)',
                      style: TextStyle(
                        color: black.withOpacity(0.7),
                        fontSize: 2.5 * SizeConfig.text!,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 16 * SizeConfig.height!,
                      child: Stack(
                        children: [
                          Container(
                            height: 7 * SizeConfig.height!,
                            margin:
                                EdgeInsets.only(top: 2.5 * SizeConfig.height!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                colorTag(
                                  color: const Color(0xFFB2D1CF),
                                  width: 4.2 * SizeConfig.width!,
                                  value: '15',
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                colorTag(
                                  color: const Color(0xFF4C6C93),
                                  width: 8 * SizeConfig.width!,
                                  value: '16',
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                colorTag(
                                  color: const Color(0xFF74DD78),
                                  width: 31 * SizeConfig.width!,
                                  value: '18.5',
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                colorTag(
                                  color: const Color(0xFFDCE683),
                                  width: 16 * SizeConfig.width!,
                                  value: '25',
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                colorTag(
                                  color: const Color(0xFFFEB447),
                                  width: 16 * SizeConfig.width!,
                                  value: '30',
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                colorTag(
                                    color: const Color(0xFFEA4450),
                                    width: 16 * SizeConfig.width!,
                                    value: '35',
                                    value2: '40'),
                              ],
                            ),
                          ),
                          bmiValue != 0.0
                              ? Positioned(
                                  top: 0,
                                  left: level > 37
                                      ? level - 4 * SizeConfig.width!
                                      : level,
                                  child: Text(
                                    bmiValue.toString(),
                                    style: TextStyle(
                                      color: black.withOpacity(0.6),
                                      fontSize: 1.7 * SizeConfig.text!,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Positioned(
                            top: 1.8 * SizeConfig.height!,
                            left: bmiValue != 0.0
                                ? level
                                : 0.5 * SizeConfig.width!,
                            child: Container(
                              width: 2.0,
                              color: black,
                              height: 6.2 * SizeConfig.height!,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              bmiData,
                              style: TextStyle(
                                color: black.withOpacity(0.7),
                                letterSpacing: 0.3,
                                fontSize: 2.5 * SizeConfig.text!,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(thickness: 2),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: black.withOpacity(0.7),
                        fontSize: 2.5 * SizeConfig.text!,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reminderButton(
                      name: 'Reminder',
                      imagePath: 'notification.PNG',
                      description: 'setup reminders to exercise.',
                      onTap: () {
                        Navigator.of(context).pushNamed('/RemindersPage');
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    reminderButton(
                      name: 'Reset',
                      imagePath: 'reset.png',
                      description: 'clear all user records in the app',
                      color: red,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return AppDialog(
                                title: 'Reset',
                                subTitle:
                                    'Are you sure you want to reset all data ?',
                                onContinue: () {
                                  ref.read(userNotifierProvider.notifier).resetUser();

                                  Navigator.pop(context);
                                },
                              );
                            });
                        // getUser();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget reminderButton({
    required String name,
    required Function() onTap,
    required String imagePath,
    Color? color,
    String? description = '',
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 4.5 * SizeConfig.height!,
            width: 4.5 * SizeConfig.height!,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.2 * SizeConfig.height!),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[color ?? blue, darkBlue],
              ),
              boxShadow: [
                BoxShadow(
                  color: blue.withOpacity(0.4),
                  offset: const Offset(0, 10),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/$imagePath',
                color: white,
                height: 3.5 * SizeConfig.height!,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: black.withOpacity(0.7),
                  fontSize: 2.2 * SizeConfig.text!,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description!,
                style: TextStyle(
                  color: black.withOpacity(0.3),
                  fontSize: 1.6 * SizeConfig.text!,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget colorTag({
    required Color color,
    required double width,
    required String value,
    String? value2,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 5 * SizeConfig.height!,
            color: color,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: grey,
                  fontSize: 1.5 * SizeConfig.text!,
                  fontWeight: FontWeight.w900,
                ),
              ),
              value2 != null
                  ? Text(
                      value2,
                      style: TextStyle(
                        color: grey,
                        fontSize: 1.5 * SizeConfig.text!,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  : const SizedBox()
            ],
          )
        ],
      ),
    );
  }

  Container settingsTile(
      String name, String imagePath, String value, Function() onTap) {
    return Container(
      height: 5.2 * SizeConfig.height!,
      padding: EdgeInsets.only(right: 4 * SizeConfig.width!),
      margin: EdgeInsets.only(bottom: 0.5 * SizeConfig.height!),
      decoration: BoxDecoration(
        color: grey.withOpacity(0.03),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/$imagePath.png',
                color: grey,
                height: 3.4 * SizeConfig.height!,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                name,
                style: TextStyle(
                  color: grey,
                  letterSpacing: 0.2,
                  fontSize: 2 * SizeConfig.text!,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          value != '0.0'
              ? GestureDetector(
                  onTap: onTap,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: blue,
                      letterSpacing: 0.3,
                      fontSize: 2 * SizeConfig.text!,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: onTap,
                  child: Image.asset(
                    'assets/icons/add.png',
                    color: grey,
                    height: 3.5 * SizeConfig.height!,
                  ),
                ),
        ],
      ),
    );
  }
}

  