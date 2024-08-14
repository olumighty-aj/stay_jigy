import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stay_jigy/pages/home/home_page.dart';
import 'package:stay_jigy/shared/route.dart';
import 'package:stay_jigy/data/database/app_db.dart';
import 'package:stay_jigy/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ExerciseDatabase.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=> const SplashPage(),
          '/HomePage': (context) => const HomePage()
        },
        title: 'Stay Jigy',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
         initialRoute: '/', 
        onGenerateRoute: RouteGenerator.generateRoute, 
        onUnknownRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
