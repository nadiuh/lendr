import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'screens/home_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/terms_conditions_screen.dart';
import 'screens/history_screen.dart';
import 'screens/item_details_screen.dart';
import 'screens/select_duration_screen.dart';
import 'screens/borrow_details_screen.dart';
import 'screens/my_bookings_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

try {
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
} catch (e) {
debugPrint('Firebase initialization skipped/failed: $e');
}

runApp(MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
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

home: SplashScreen(),

routes: {
'/home': (context) => const HomeScreen(),

'/notifications': (context) =>
const NotificationsScreen(),

'/terms': (context) =>
const TermsConditionsScreen(),

'/history': (context) =>
const HistoryScreen(),

'/item_details': (context) => const ItemScreen(
imagePath: 'assets/images/camera.png',
itemName: 'Camera',
price: '৳7000/day',
lender: 'Taseen Ehfaz',
),

'/select_duration': (context) =>
const SelectDurationScreen(
itemName: 'Camera',
price: '৳7000/day',
lender: 'Taseen Ehfaz',
),

'/borrow_details': (context) =>
const BorrowDetailsScreen(
selectedDuration: 1,
dailyPrice: 550,
itemName: 'Camera',
price: '৳7000/day',
lender: 'Taseen Ehfaz',
),

'/my_bookings': (context) =>
const MyBookingsScreen(),
},
);
}
}