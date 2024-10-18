import 'package:distriservicios_app_2/widgets/components/login.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogIn()),
              );
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
}
