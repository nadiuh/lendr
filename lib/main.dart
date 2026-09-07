import 'package:flutter/material.dart';
import 'package:lendr_new/screens/history_screen.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'screens/home_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/terms_conditions_screen.dart';

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
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/terms': (context) => const TermsConditionsScreen(),
        '/history':(context) => const HistoryScreen(),
      },
    );
  }
}