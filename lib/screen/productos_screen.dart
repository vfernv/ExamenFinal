import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/list_provider.dart';
import 'package:flutter_application_1/screen/product_edicion_screen.dart';
import 'package:provider/provider.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listProduProvider = Provider.of<ListProduProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Productos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 98, 155),
      ),
      body: ListView.builder(
        itemCount: listProduProvider.ListadoProductos.length,
        itemBuilder: (context, index) {
          final product = listProduProvider.ListadoProductos[index];
          return Column(
            children: [
              ListTile(
                title: Text(product.productName),
                subtitle: Text('\$${product.productPrice}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductEdicionScreen(product: product),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await listProduProvider
                            .deteleProduct(product.productId);
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
