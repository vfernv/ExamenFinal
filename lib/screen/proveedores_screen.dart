import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/list_prove_provider.dart';
import 'package:flutter_application_1/screen/prov_edicion_screen.dart';
import 'package:provider/provider.dart';

class ProveedoresScreen extends StatelessWidget {
  const ProveedoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listProveProvider = Provider.of<ListProveProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Proveedores',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 98, 155),
      ),
      body: ListView.builder(
        itemCount: listProveProvider.ListadoProveedores.length,
        itemBuilder: (context, index) {
          final proveedores = listProveProvider.ListadoProveedores[index];
          return Column(
            children: [
              ListTile(
                title: Text(proveedores.providerName),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditarProveedorScreen(
                              providerName: proveedores.providerName,
                              providerId: proveedores.providerid,
                              providerState: proveedores.providerState,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await listProveProvider
                            .deteleProvide(proveedores.providerid);
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
