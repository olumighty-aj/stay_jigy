import 'package:flutter/material.dart';
import 'package:stay_jigy/pages/home/home_page.dart';
import 'package:stay_jigy/shared/route.dart';
import 'package:stay_jigy/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=> SplashPage(),
        '/HomePage': (context) => HomePage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       initialRoute: '/', 
      onGenerateRoute: RouteGenerator.generateRoute, 
      onUnknownRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
