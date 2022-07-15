import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hms_iiitm_gwalior/auth_controller.dart';
import 'package:hms_iiitm_gwalior/views/login_view.dart';
import 'package:hms_iiitm_gwalior/views/sign_up.dart';
import 'package:hms_iiitm_gwalior/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView()

    );
  }
}