import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';

void main() {
  runApp(const RoastMonitorApp());
}

class RoastMonitorApp extends StatelessWidget {
  const RoastMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Roast Monitor',

      theme: ThemeData(
        fontFamily: 'Poppins',
      ),

      home: const MainNavigation(),
    );
  }
}