import 'package:flutter/material.dart';
import 'package:ngdemo7/pages/3dflip.dart';
import 'package:ngdemo7/pages/bounce_page.dart';
import 'package:ngdemo7/pages/fade_page.dart';
import 'package:ngdemo7/pages/hinge_page.dart';
import 'package:ngdemo7/pages/home_page.dart';
import 'package:ngdemo7/pages/lottie_page.dart';
import 'package:ngdemo7/pages/slide_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HingePage(),
    );
  }
}
