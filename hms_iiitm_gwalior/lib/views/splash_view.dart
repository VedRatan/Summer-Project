import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_iiitm_gwalior/Views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'home_page.dart';

SplashView main() {
  WidgetsFlutterBinding.ensureInitialized();
  return SplashView();
}

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      // Get.to(LoginView());
    });
        return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text(
                'HMS-IIITM',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                    fontSize: 35),
              ),
            ));
  }
}
