import 'package:flutter/material.dart';
import 'package:app_employe/Splash_screen.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
    home: SplashScreen(),
    defaultTransition: Transition.leftToRight,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    debugShowCheckedModeBanner: false));
