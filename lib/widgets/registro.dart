import 'package:flutter/material.dart';

class crearCuenta extends StatelessWidget {
  const crearCuenta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('Obligatorio', style: TextStyle(color: Colors.grey),)
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),  
                  hintText: 'Escribe tu nombre aquí', 
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 20),
    
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Apellido', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('Obligatorio', style: TextStyle(color: Colors.grey),)
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),  
                  hintText: 'Escribe tu apellido aquí', 
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
    
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Correo electrónico', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('Obligatorio', style: TextStyle(color: Colors.grey),)
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),  
                  hintText: 'Escribe tu correo aquí', 
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Crear contraseña', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('Obligatorio', style: TextStyle(color: Colors.grey),)
                ],
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),  
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 20),
    
              const Row(
                children: [
                  Checkbox(value: false, onChanged: null),
                  Flexible(child:Text('Acepto recibir informacion de ofertas y promociones')),
                ],
              ),
              const Row(
                children: [
                  Checkbox(value: false, onChanged: null),
                  Flexible( child: Text(
                    'Acepto los Términos y condiciones y la Política de privacidad'
                    )
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom( 
                  backgroundColor:Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: (){},
                child:const  Text('Registrate', style: TextStyle(fontWeight: FontWeight.bold),)
              )
            ],
          )
        ],
      )
    );
  }
}