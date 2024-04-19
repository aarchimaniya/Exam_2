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
                "https://i.pinimg.com/564x/37/16/5f/37165ffcc65667296c37edd81fe78212.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
