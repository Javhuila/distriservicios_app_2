import 'package:distriservicios_app_2/firebase_options.dart';
import 'package:distriservicios_app_2/widgets/components/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/components/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  // final bool isLoggedIn;

  const MyApp({
    super.key,
    // required this.isLoggedIn
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DistriServicios App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: isLoggedIn ? const Home() : const LogIn(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            return user != null ? const Home() : const LogIn();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
