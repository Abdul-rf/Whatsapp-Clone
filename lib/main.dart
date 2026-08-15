import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF111B21),
      ),

      home: const SplashScreen(),
    );
  }
}
