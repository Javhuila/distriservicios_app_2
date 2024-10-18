import 'package:distriservicios_app_2/widgets/components/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () async {
              await logoutUser(context);
            },
            child: Text(
              "Cerrar Sesión",
              style: TextStyle(
                fontSize: 36,
                backgroundColor: Colors.purple[200],
                color: Colors.white,
              ),
            )),
      ),
    );
  }

  Future<void> logoutUser(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userCorreo');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogIn()),
      );
    });
  }
}
