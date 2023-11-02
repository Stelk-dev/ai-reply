import 'package:flutter/material.dart';
import 'package:replies/onboarding/launch_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // If it's not logged -> show default page
  // If it's logged -> show main page

  @override
  Widget build(BuildContext context) {
    return LaunchPage();
  }
}
