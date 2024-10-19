import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/list_provider.dart';
import 'package:flutter_application_1/widgets/productos.dart';

class ProductEdicionScreen extends StatefulWidget {
  final Listado product; 

  const ProductEdicionScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductEdicionScreenState createState() => _ProductEdicionScreenState();
}

class _ProductEdicionScreenState extends State<ProductEdicionScreen> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.productName);
    _priceController = TextEditingController(text: widget.product.productPrice.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listProduProvider = Provider.of<ListProduProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
        backgroundColor: const Color.fromARGB(255, 30, 98, 155),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre del Producto'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Precio del Producto'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await listProduProvider.updateProduct(
                  widget.product.productId,
                  _nameController.text,
                  int.parse(_priceController.text),
                );
                Navigator.pop(context); 
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
