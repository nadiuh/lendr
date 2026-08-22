import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _logoScaleAnimation;
  late final Animation<double> _appNameFadeAnimation;

  Timer? _navigationTimer;

  static const Color _backgroundColor = Color(0xFFEFE8DB);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOut),
      ),
    );

    _appNameFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.35, 0.85, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();

    _navigationTimer = Timer(const Duration(seconds: 3), _navigateToLogin);
  }

  void _navigateToLogin() {
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _logoScaleAnimation,
                  child: Image.asset(
                    'assets/images/Logo/Lendr_logo.png',
                    width: 388,
                    height: 388,
                    fit: BoxFit.contain,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -115),
                  child: FadeTransition(
                    opacity: _appNameFadeAnimation,
                    child: Image.asset(
                      'assets/images/Logo/Logo_text.png',
                      width: screenWidth * 0.95 > 650 ? 650 : screenWidth * 0.95,
                      height: 238,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
