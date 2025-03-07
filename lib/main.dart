import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/features/bottom_app_bar/bottom_app_bar.dart';
import 'package:shoes_app/features/cart/cart_screen.dart';
import 'package:shoes_app/features/home/home_screen.dart';
import 'package:shoes_app/features/home/provider/home_provider.dart';
import 'package:shoes_app/features/notification/notification.dart';
import 'package:shoes_app/features/onboarding/onboarding_screen.dart';
import 'package:shoes_app/features/profile/profile_screen.dart';
import 'package:shoes_app/routes/router_config.dart';

void main() {
  /*

  By Aditya Thakur (flutter.spirit)

  */
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      // home: const CustomBottomAppBar(),
      home: const OnboardingScreen(),
      routes: {
        AppRoutes.homeScreen: (_) => HomeScreen(),
        AppRoutes.cartScreen: (_) => CartScreen(),
        AppRoutes.profileScreen: (_) => ProfileScreen(),
        AppRoutes.notificationScreen: (_) => NotificationScreen(),
        AppRoutes.likeScreen: (_) => HomeScreen(),
        AppRoutes.onboardingScreen: (_) => OnboardingScreen(),
      },
    );
  }
}
