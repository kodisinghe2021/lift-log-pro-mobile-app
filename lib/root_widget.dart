import 'package:flutter/material.dart';
import 'package:liftlogpro_app/presentation/screens/splash_screen.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

