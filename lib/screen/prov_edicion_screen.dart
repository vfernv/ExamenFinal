import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/list_prove_provider.dart';
import 'package:provider/provider.dart';

class EditarProveedorScreen extends StatelessWidget {
  final String providerName;
  final String providerState;
  final int providerId;

  EditarProveedorScreen(
      {required this.providerName,
      required this.providerState,
      required this.providerId});

  @override
  Widget build(BuildContext context) {
    final listProvProvider = Provider.of<ListProveProvider>(context);
    final TextEditingController nameController =
        TextEditingController(text: providerName);
    final TextEditingController stateController =
        TextEditingController(text: providerState);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Proveedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre del proveedor'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: stateController,
              decoration: InputDecoration(labelText: 'Estado del proveedor'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await listProvProvider.updateProvider(
                    providerId, nameController.text, stateController.text);
                Navigator.pop(context);
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
