import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stay_jigy/data/database/app_db.dart';
import 'package:stay_jigy/data/model/user.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<User> build() async {
    return ExerciseDatabase.instance.user();
  }

  Future<void> updateUser(String field, String value) async {
    await ExerciseDatabase.instance.updateUser(field, value);
    ref.invalidateSelf();
  }

  Future<void> resetUser() async {
    await ExerciseDatabase.instance.resetUser();
    ref.invalidateSelf();
  }

  Future<void> calculateBMI() async {
    final currentUser = await ExerciseDatabase.instance.user();
    if (currentUser.weight != null && currentUser.weight!.isNotEmpty &&
        currentUser.height != null && currentUser.height!.isNotEmpty) {
      double weightValue = double.parse(currentUser.weight!);
      double heightValue = double.parse(currentUser.height!);
      double bmi = (weightValue / (heightValue * heightValue)) * 10000;
      await updateUser('bmi', bmi.toStringAsFixed(1));
    }
  }

  String getBMIData(double bmiValue) {
    if (bmiValue > 0.0 && bmiValue <= 18.49) {
      return 'Not meet the standard';
    } else if (bmiValue >= 18.50 && bmiValue <= 24.9) {
      return 'Normal';
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      return 'Overweight';
    } else if (bmiValue >= 30 && bmiValue <= 34.9) {
      return 'Obesity Degree 1';
    } else if (bmiValue >= 35 && bmiValue <= 39.9) {
      return 'Obesity Degree 2';
    } else if (bmiValue >= 40) {
      return 'Obesity Degree 3';
    }
    return '';
  }

  double getBMILevel(double bmiValue) {
    if (bmiValue > 0.0 && bmiValue <= 18.49) {
      return bmiValue > 15 ? bmiValue * 3 : 5;
    } else if (bmiValue >= 18.50 && bmiValue <= 24.9) {
      return bmiValue * 3;
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      return 26 > bmiValue ? bmiValue * 7.2 : bmiValue * 8;
    } else if (bmiValue >= 30 && bmiValue <= 34.9) {
      return 31 > bmiValue ? bmiValue * 8.1 : bmiValue * 8.6;
    } else if (bmiValue >= 35 && bmiValue <= 39.9) {
      return 36 > bmiValue ? bmiValue * 8.7 : bmiValue * 9;
    } else if (bmiValue >= 40) {
      return 362;
    }
    return 0;
  }
}