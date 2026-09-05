import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'screens/splash_screen.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: AppStrings.appName,
debugShowCheckedModeBanner: false,
theme: ThemeData(
useMaterial3: true,
scaffoldBackgroundColor: AppColors.background,
colorScheme: ColorScheme.fromSeed(
seedColor: AppColors.primary,
primary: AppColors.primary,
surface: AppColors.surface,
),
textTheme: GoogleFonts.poppinsTextTheme(
Theme.of(context).textTheme,
),
),
home: const SplashScreen(),
);
}
}