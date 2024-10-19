import 'dart:convert';
import 'package:flutter_application_1/widgets/productos.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListProduProvider extends ChangeNotifier {
  String APIUSER = 'test';
  String APIPASS = 'test2023';
  String BASEURL = '143.198.118.203:8100';
  List<Listado> ListadoProductos = [];

  ListProduProvider() {
    getListProve();
  }

  getListProve() async {
    var url = Uri.http(BASEURL, 'ejemplos/product_list_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final Map<String, dynamic> dataDecode = json.decode(response.body);
    final eProductListRestToJson = ProductListRest.fromJson(dataDecode);
    ListadoProductos = eProductListRestToJson.listado;
    notifyListeners(); //notifica a los widgets cuando hay un cambio en la data
  }

  //metodo para eliminar producto
  Future<void> deteleProduct(int productid) async {
    var url = Uri.http(BASEURL, 'ejemplos/product_del_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';

    final response = await http.post(
      url,
      headers: {'authorization': basicAuth, 'Content-Type': 'application/json'},
      body: jsonEncode({'product_id': productid}),
    );

    print(response.body);
    if (response.statusCode == 200) {
      ListadoProductos.removeWhere(
          (productos) => productos.productId == productid);
      notifyListeners();
    } else {
      print(
          'Error al eliminar categoría. Código de estado: ${response.statusCode}');
    }
  }

  //metodo para actualizar producto
  Future<void> updateProduct(
      int productId, String newName, int newPrice) async {
    var url = Uri.http(BASEURL, 'ejemplos/product_edit_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';

    final body = jsonEncode({
      'product_id': productId,
      'product_name': newName,
      'product_price': newPrice,
    });

    print('Enviando solicitud con cuerpo: $body');

    final response = await http.post(
      url,
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: body,
    );

    print('Respuesta del servidor: ${response.body}');

    if (response.statusCode == 200) {
      final index = ListadoProductos.indexWhere(
          (product) => product.productId == productId);
      if (index != -1) {
        ListadoProductos[index].productName = newName;
        ListadoProductos[index].productPrice = newPrice as int;
        notifyListeners();
      }
    } else {
      print('Error al actualizar el producto: ${response.statusCode}');
    }
  }
}
