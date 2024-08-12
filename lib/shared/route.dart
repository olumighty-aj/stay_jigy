// import 'package:flutter/material.dart';
// import 'package:stay_jigy/data/model/event.dart';
// import 'package:stay_jigy/data/model/exercise_model.dart';
// import 'package:stay_jigy/data/model/level_model.dart';
// import 'package:stay_jigy/pages/home/exercise_details_page.dart';
// import 'package:stay_jigy/pages/home/home_page.dart';
// import 'package:stay_jigy/widgets/bottom_nav_bar.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings? settings) {
//     final arguments = settings?.arguments;
//     switch (settings?.name) {
//       case '/BottomNavBar':
//         ScreenArguments item = arguments as ScreenArguments;

//         return createRoute(child: BottomNavBar(newArgu: item));

//       case '/HomePage':
//         return createRoute(child: const HomePage());

//       // case '/ReportsPage':
//       //   return createRoute(child: const ReportsPage());

//       // case '/ViewAllExercisePage':
//       //   Levels level = arguments as Levels;
//       //   return createRoute(
//       //     child: ViewAllExercise(
//       //       level: level,
//       //     ),
//       //   );
//      // case '/ReadyPage':
//        // WorkoutArguments w = arguments as WorkoutArguments;
//         // return createRoute(
//         //   child: ReadyPage(
//         //     w: w,
//         //     // level: w.level,
//         //     // duration: w.duration,
//         //   ),
//         // );
//       case '/ExerciseDetailsPage':
//         Exercise exercise = arguments as Exercise;
//         return createRoute(
//           child: ExerciseDetailsPage(
//             exercise: exercise,
//           ),
//         );

//       // case '/CompletePage':
//       //   CompletPageArguments level = arguments as CompletPageArguments;
//       //   return createRoute(
//       //     child: CompletePage(
//       //       arg: level,
//       //     ),
//       //   );

//       // case '/HistoryPage':
//       //   return createRoute(child: const HistoryPage());

//       // case '/RemindersPage':
//       //   return createRoute(child: const RemindersPage());

//       default:
//         // If there is no such named route in the switch statement
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Error'),
//         ),
//         body: const Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
// }

// Route createRoute({required Widget child}) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var begin = const Offset(0.0, 0.0);
//       var end = Offset.zero;
//       var curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

// class ScreenArguments {
//   final int index;
//   final bool isJump;

//   ScreenArguments(this.index, this.isJump);
// }

// class CompletPageArguments {
//   final Levels levels;
//   final Event event;

//   CompletPageArguments(this.levels, this.event);
// }

// class WorkoutArguments {
//   final int duration;
//   final Levels level;

//   WorkoutArguments(this.duration, this.level);
// }

import 'package:flutter/material.dart';
import 'package:stay_jigy/data/model/event.dart';
import 'package:stay_jigy/data/model/exercise_model.dart';
import 'package:stay_jigy/data/model/level_model.dart';
import 'package:stay_jigy/pages/home/exercise_details_page.dart';
import 'package:stay_jigy/pages/home/home_page.dart';
import 'package:stay_jigy/pages/home/ready_page.dart';
import 'package:stay_jigy/widgets/bottom_nav_bar.dart';
import 'package:stay_jigy/pages/home/view_all_exercise.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    final arguments = settings?.arguments;
    switch (settings?.name) {
      case '/BottomNavBar':
        ScreenArguments item = arguments as ScreenArguments;
        return createRoute(child: BottomNavBar(newArgu: item));

      case '/HomePage':
        return createRoute(child: const HomePage());

      case '/ExerciseDetailsPage':
        Exercise exercise = arguments as Exercise;
        return createRoute(
          child: ExerciseDetailsPage(
            exercise: exercise,
          ),
        );

      case '/ViewAllExercisePage':
        Levels level = arguments as Levels;
        return createRoute(
          child: ViewAllExercise(
            level: level,
          ),
        );

             case '/ReadyPage':
       WorkoutArguments w = arguments as WorkoutArguments;
        return createRoute(
          child: ReadyPage(
            w: w,
            // level: w.level,
            // duration: w.duration,
          ),
        );

      default:
        return _errorRoute(); // Call _errorRoute() directly since it's static
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

Route createRoute({required Widget child}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ScreenArguments {
  final int index;
  final bool isJump;

  ScreenArguments(this.index, this.isJump);
}

class CompletPageArguments {
  final Levels levels;
  final Event event;

  CompletPageArguments(this.levels, this.event);
}

class WorkoutArguments {
  final int duration;
  final Levels level;

  WorkoutArguments(this.duration, this.level);
}
