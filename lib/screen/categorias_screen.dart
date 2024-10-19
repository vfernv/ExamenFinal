import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/list_cat_provider.dart';
import 'package:flutter_application_1/screen/cat_edicion_screen.dart';
import 'package:provider/provider.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listCatProvider = Provider.of<ListCatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorias',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 98, 155),
      ),
      body: ListView.builder(
        itemCount: listCatProvider.ListadoCategorias.length,
        itemBuilder: (context, index) {
          final category = listCatProvider.ListadoCategorias[index];
          return Column(
            children: [
              ListTile(
                title: Text(category.categoryName),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditarCategoriaScreen(
                              categoryName: category.categoryName,
                              categoryId: category.categoryId,
                              categoryState: category.categoryState,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await listCatProvider
                            .deleteCategory(category.categoryId);
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
