import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geeve_firebase/screen/login/login_screen.dart';
import 'package:geeve_firebase/screen/signin/demo_screen.dart';
import 'package:geeve_firebase/screen/splash/splash_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAU9zvDMepeD0gTgxDxOfVo7W0ecSqzWaE",
          appId: "1:384251207983:android:68ee86012a0ae6916881da",
          messagingSenderId: "384251207983",
          projectId: "geeve-firebase-593b7"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
