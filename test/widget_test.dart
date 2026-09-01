import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lendr_new/main.dart';
import 'package:lendr_new/screens/login_screen.dart';
import 'package:lendr_new/screens/profile_screen.dart';
import 'package:lendr_new/screens/signup_screen.dart';
import 'package:lendr_new/screens/splash_screen.dart';
import 'package:lendr_new/utils/validators.dart';

void main() {
  group('Validators Unit Tests', () {
    test('Email validation properly rejects invalid emails and accepts valid emails', () {
      // Invalid emails
      expect(Validators.validateEmail(''), 'Please enter your email');
      expect(Validators.validateEmail(null), 'Please enter your email');
      expect(Validators.validateEmail('   '), 'Please enter your email');
      expect(Validators.validateEmail('nadia'), 'Please enter a valid email address');
      expect(Validators.validateEmail('nadia@gmail'), 'Please enter a valid email address');
      expect(Validators.validateEmail('hello123'), 'Please enter a valid email address');
      expect(Validators.validateEmail('user@.com'), 'Please enter a valid email address');
      expect(Validators.validateEmail('@domain.com'), 'Please enter a valid email address');

      // Valid emails
      expect(Validators.validateEmail('name@gmail.com'), isNull);
      expect(Validators.validateEmail('name@yahoo.com'), isNull);
      expect(Validators.validateEmail('name@outlook.com'), isNull);
      expect(Validators.validateEmail('student@university.edu'), isNull);
      expect(Validators.validateEmail('member@organization.org.bd'), isNull);
      expect(Validators.validateEmail('john.doe+tag@sub.domain.co'), isNull);
    });

    test('Full Name validation', () {
      expect(Validators.validateFullName(''), 'Please enter your full name');
      expect(Validators.validateFullName(null), 'Please enter your full name');
      expect(Validators.validateFullName('   '), 'Please enter your full name');
      expect(Validators.validateFullName('Nadia Rahman'), isNull);
    });

    test('Password and Confirm Password validation', () {
      expect(Validators.validatePassword(''), 'Please enter your password');
      expect(Validators.validatePassword('', isCreate: true), 'Please enter a password');
      expect(Validators.validatePassword('secret123'), isNull);

      expect(Validators.validateConfirmPassword('', 'secret123'), 'Please confirm your password');
      expect(Validators.validateConfirmPassword('wrong', 'secret123'), 'Passwords do not match');
      expect(Validators.validateConfirmPassword('secret123', 'secret123'), isNull);
    });
  });

  group('Widget Tests', () {
    testWidgets('App smoke test renders SplashScreen', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(SplashScreen), findsOneWidget);
    });

    testWidgets('LoginScreen validates email and password upon submit', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Tap login with empty fields
      await tester.ensureVisible(find.text('LOGIN'));
      await tester.tap(find.text('LOGIN'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);

      // Enter invalid email format
      await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email'), 'nadia@gmail');
      await tester.pumpAndSettle();

      expect(find.text('Please enter a valid email address'), findsOneWidget);

      // Enter valid email format
      await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email'), 'nadia@gmail.com');
      await tester.pumpAndSettle();

      expect(find.text('Please enter a valid email address'), findsNothing);
    });

    testWidgets('SignupScreen validates full name, email, and matching passwords', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignupScreen(),
        ),
      );

      // Tap Create Account with empty fields
      await tester.ensureVisible(find.text('CREATE ACCOUNT'));
      await tester.tap(find.text('CREATE ACCOUNT'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your full name'), findsOneWidget);
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter a password'), findsOneWidget);
      expect(find.text('Please confirm your password'), findsOneWidget);

      // Enter invalid email
      await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email'), 'hello123');
      await tester.pumpAndSettle();
      expect(find.text('Please enter a valid email address'), findsOneWidget);

      // Enter mismatched passwords
      await tester.enterText(find.widgetWithText(TextFormField, 'Create a password'), 'password123');
      await tester.enterText(find.widgetWithText(TextFormField, 'Confirm your password'), 'differentPass');
      await tester.pumpAndSettle();
      expect(find.text('Passwords do not match'), findsOneWidget);

      // Fix password match
      await tester.enterText(find.widgetWithText(TextFormField, 'Confirm your password'), 'password123');
      await tester.pumpAndSettle();
      expect(find.text('Passwords do not match'), findsNothing);
    });

    testWidgets('ProfileScreen logout dialog cancel stays on profile screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: ProfileScreen(),
        ),
      );

      // Scroll to and tap Log Out button
      await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Log Out'));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Log Out'));
      await tester.pumpAndSettle();

      // Verify dialog is shown
      expect(find.text('Are you sure you want to log out of your Lendr account?'), findsOneWidget);

      // Tap Cancel
      await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
      await tester.pumpAndSettle();

      // Verify dialog is closed and still on ProfileScreen
      expect(find.text('Are you sure you want to log out of your Lendr account?'), findsNothing);
      expect(find.byType(ProfileScreen), findsOneWidget);
      expect(find.byType(LoginScreen), findsNothing);
    });

    testWidgets('ProfileScreen logout confirmation navigates to LoginScreen with "Logging out" SnackBar', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: ProfileScreen(),
        ),
      );

      // Scroll to and tap Log Out button
      await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Log Out'));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Log Out'));
      await tester.pumpAndSettle();

      // In the dialog, tap 'Log Out' button
      final dialogLogoutBtn = find.descendant(
        of: find.byType(AlertDialog),
        matching: find.widgetWithText(ElevatedButton, 'Log Out'),
      );
      await tester.tap(dialogLogoutBtn);
      await tester.pumpAndSettle();

      // Verify SnackBar with 'Logging out' is displayed
      expect(find.text('Logging out'), findsOneWidget);
      // Verify navigated to LoginScreen
      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.byType(ProfileScreen), findsNothing);
    });
  });
}

