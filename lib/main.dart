import 'package:flutter/material.dart';
import 'screens/item_details_screen.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ItemScreen(),
    );
  }
}