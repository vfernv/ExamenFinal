import 'dart:convert';
import 'package:flutter_application_1/widgets/proveedores.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListProveProvider extends ChangeNotifier {
  String APIUSER = 'test';
  String APIPASS = 'test2023';
  String BASEURL = '143.198.118.203:8100';
  List<ProveedoresListado> ListadoProveedores = [];

  ListProveProvider() {
    getListProve();
  }

  getListProve() async {
    var url = Uri.http(BASEURL, 'ejemplos/provider_list_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final Map<String, dynamic> dataDecode = json.decode(response.body);
    final eProveeListRestToJson = Proveedores.fromJson(dataDecode);
    ListadoProveedores = eProveeListRestToJson.proveedoresListado;
    notifyListeners(); //notifica a los widgets cuando hay un cambio en la data
  }

  //metodo para eliminar proveedor
  Future<void> deteleProvide(int providerid) async {
    var url =
        Uri.http(BASEURL, 'ejemplos/provider_del_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';

    final response = await http.post(
      url,
      headers: {
        'authorization': basicAuth,
        'Content-Type':
            'application/json' 
      },
      body: jsonEncode({'provider_id': providerid}), 
    );

    print(response.body);
    if (response.statusCode == 200) {
      ListadoProveedores.removeWhere(
          (provider) => provider.providerid == providerid);
      notifyListeners(); 
    } else {
      print(
          'Error al eliminar categoría. Código de estado: ${response.statusCode}');
    }
  }

  //metodo para actualizar proveedor
  Future<void> updateProvider(
      int providerId, String newName, String newState) async {
    var url = Uri.http(BASEURL,
        'ejemplos/provider_edit_rest/'); 
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';

    final response = await http.post(
      url,
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'provider_id': providerId,
        'provider_name': newName,
        'provider_state':
            newState, 
      }),
    );

    if (response.statusCode == 200) {
      final index = ListadoProveedores.indexWhere(
          (prov) => prov.providerid == providerId);
      if (index != -1) {
        ListadoProveedores[index].providerName = newName;
        ListadoProveedores[index].providerState =
            newState; 
        notifyListeners(); 
      }
    } else {
      print(
          'Error al actualizar categoría. Código de estado: ${response.statusCode}');
    }
  }
}
