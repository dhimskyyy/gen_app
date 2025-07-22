import 'package:flutter/material.dart';
import 'splash_screen/splash_screen.dart';
import 'home_screen.dart';
import 'splash_screen/onboarding_screen.dart';
import 'permission_screen/permission_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'YourFont', // opsional
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/permission': (context) => const PermissionScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
