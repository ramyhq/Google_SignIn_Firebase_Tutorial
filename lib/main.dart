import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_colne_with_jitsi/screens/home_screen.dart';
import 'package:zoom_colne_with_jitsi/screens/login_screen.dart';
import 'package:zoom_colne_with_jitsi/screens/video_call_creen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(36, 36, 36, 1),
      ),
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) =>  LoginScreen(),
          HomeScreen.id: (context) =>  HomeScreen(),
          VideoCallScreen.id: (context) =>  VideoCallScreen(),
        });

  }
}
