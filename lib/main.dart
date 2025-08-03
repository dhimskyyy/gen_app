import 'package:flutter/material.dart';
import 'splash_screen/splash_screen.dart';
import 'home_screen.dart';
import 'splash_screen/onboarding_screen.dart';
import 'permission_screen/permission_screen.dart';
import 'login_screen/login_screen.dart';
import './register_screen.dart/register_screen.dart';
import 'linked_screen/linked_screen.dart';
import 'linked_screen/step_install_child.dart';
import 'linked_screen/step_connect_device.dart';
import 'linked_screen/step_success.dart';
import 'theme/app_colors.dart';
import 'location/location_screen.dart';

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
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/linked': (context) => const StepIntro(),
        '/step_intro': (context) => const StepIntro(),
        '/step_install_child': (context) => const StepInstallChild(),
        '/step_connect_device': (context) => const StepConnectDevice(),
        '/step_success': (context) => const StepSuccess(),
        '/location': (context) => const LocationScreen(),
      },
    );
  }
}
