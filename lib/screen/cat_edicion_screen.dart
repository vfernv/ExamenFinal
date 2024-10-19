import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/list_cat_provider.dart';
import 'package:provider/provider.dart';

class EditarCategoriaScreen extends StatelessWidget {
  final String categoryName;
  final String categoryState;
  final int categoryId;

  EditarCategoriaScreen(
      {required this.categoryName,
      required this.categoryState,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final listCatProvider = Provider.of<ListCatProvider>(context);
    final TextEditingController nameController =
        TextEditingController(text: categoryName);
    final TextEditingController stateController =
        TextEditingController(text: categoryState);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Categoría'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre de la Categoría'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: stateController,
              decoration: InputDecoration(labelText: 'Estado de la Categoría'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // lógica para actualizar la categoría
                await listCatProvider.updateCategory(
                    categoryId, nameController.text, stateController.text);
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
