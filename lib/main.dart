import 'package:flutter/material.dart';

import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      'splash_screen': (context) => const SplashScreen(),
      '/': (context) => const HomeScreen(),
      'details_screen': (context) => const DetailScreen(),
    },
  ));
}
