import 'dart:async';

import 'package:flutter/material.dart';
import 'welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21),

      body: SafeArea(
        child: Column(
          children: [
            // Center section
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // WhatsApp logo
                    Image.asset(
                      'assets/whatsapp_logo.png',
                      width: 80,
                      height: 80,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Bottom section
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),

                  Image.asset("assets/Meta.png", width: 120, height: 45),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
