import 'package:flutter/material.dart';
import '../screen/screen.dart';

class Inicio1 extends StatelessWidget {
  const Inicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300, 
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Iniciar Sesión'),
            ),
          ),
          const SizedBox(height: 20), 
          SizedBox(
            width: 300, 
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistroScreen()),
                );
              },
              child: const Text('Registro'),
            ),
          ),
        ],
      ),
    );
  }
}
