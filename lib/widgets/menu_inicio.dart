import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/categorias_screen.dart';
import 'package:flutter_application_1/screen/productos_screen.dart';
import 'package:flutter_application_1/screen/proveedores_screen.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 98, 155),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 98, 155),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProveedoresScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 260,
                  color: const Color.fromARGB(255, 111, 176, 236),
                  alignment: Alignment.center,
                  child: const Text(
                    'Proveedores',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoriasScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 270,
                  color: const Color.fromARGB(255, 111, 176, 236),
                  alignment: Alignment.center,
                  child: const Text(
                    'Categorias',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductosScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 260,
                  color: const Color.fromARGB(255, 111, 176, 236),
                  alignment: Alignment.center,
                  child: const Text(
                    'Productos',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
