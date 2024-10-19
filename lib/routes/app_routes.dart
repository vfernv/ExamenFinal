import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/categorias_screen.dart';
import 'package:flutter_application_1/screen/productos_screen.dart';
import 'package:flutter_application_1/screen/proveedores_screen.dart';

import '../screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'login': (BuildContext context)=> const LoginScreen(),
    'registro': (BuildContext context)=> const RegistroScreen(),
    'menu': (BuildContext context)=> const Menu(),
    'productos': (BuildContext context)=> ProductosScreen(),
    'proveedores': (BuildContext context)=> ProveedoresScreen(),
    'categorias': (BuildContext context)=> CategoriasScreen(),
    
  };


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
