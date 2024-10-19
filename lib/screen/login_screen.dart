import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/login_provider.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/widgets/card_container.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 98, 155),
        title: const Center(child: Text('Iniciar sesión', style: TextStyle(fontWeight: FontWeight.bold))) 
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50), 
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('Login',style: TextStyle(fontSize: 24),),
                  const SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const LoginForm(),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, 'registro'),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.indigo.withOpacity(0.1)),
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                    ),
                    child: const Text('No tienes cuenta? Regístrate aquí', style: TextStyle(fontSize: 16, color: Colors.blue),),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginFormProvider.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Correo electrónico',
            border: OutlineInputBorder(), 
          ),
          onChanged: (value) => loginFormProvider.email = value,
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : 'El usuario no puede estar vacío o debe tener al menos 6 o más caracteres';
          },
        ),
        const SizedBox(height: 16), 
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Contraseña',
            border: OutlineInputBorder(), 
          ),
          onChanged: (value) => loginFormProvider.password = value,
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : 'La contraseña no puede estar vacía o debe tener al menos 6 o más caracteres';
          },
        ),
        const SizedBox(height: 16), 
        SizedBox(
          width: double.infinity, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 11, 23, 94), 
              padding: const EdgeInsets.symmetric(vertical: 16.0), 
            ),
            onPressed: loginFormProvider.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authService = Provider.of<AuthService>(context, listen: false);
                    if (!loginFormProvider.isValidForm()) return;
                    loginFormProvider.isLoading = true;

                    final String? errorMessage = await authService.login(
                      loginFormProvider.email,
                      loginFormProvider.password,
                    );

                    if (errorMessage == null) {
                      
                      Navigator.pushReplacementNamed(context, 'menu');
                    } else {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usuario o contraseña incorrecta'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }

                    loginFormProvider.isLoading = false;
                  },
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
