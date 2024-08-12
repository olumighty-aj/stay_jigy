import 'package:flutter/material.dart';
import 'package:stay_jigy/pages/home/home_page.dart';
import 'package:stay_jigy/shared/route.dart';
import 'package:stay_jigy/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=> SplashPage(),
        '/HomePage': (context) => HomePage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       initialRoute: '/', // Specify the initial route
      onGenerateRoute: RouteGenerator.generateRoute, // Use your RouteGenerator
      onUnknownRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
