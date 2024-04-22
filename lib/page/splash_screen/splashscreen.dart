import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_route/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen(BuildContext context) {}
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        AppRoutes.homepage,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/564x/93/bd/70/93bd70724fce6fcee0d497becdb61fec.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
