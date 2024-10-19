import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/inicio.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //Provider.of<LoginFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 98, 155),
        toolbarHeight: MediaQuery.of(context).size.height,
        flexibleSpace: const Inicio1(),
      ),
    );
  }
}
