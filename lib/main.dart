import 'package:flutter/material.dart';
import 'navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shalat Reminder',

      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xffF8FAFC),

        fontFamily: 'Roboto',

        colorScheme: ColorScheme.fromSeed(
          seedColor:
              const Color(0xff16A34A),
        ),

        useMaterial3: true,
      ),

      home: const NavigationPage(),
    );
  }
}