import 'dart:convert';
import 'package:flutter_application_1/widgets/categorias.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListCatProvider extends ChangeNotifier {
  String APIUSER = 'test';
  String APIPASS = 'test2023';
  String BASEURL = '143.198.118.203:8100';
  List<ListadoCategoria> ListadoCategorias = [];

  ListCatProvider() {
    getListProve();
  }

  getListProve() async {
    var url = Uri.http(BASEURL, 'ejemplos/category_list_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    print(response.body);
    //creearemos un mapa
    final Map<String, dynamic> dataDecode = json.decode(response.body);
    final eCateListRestToJson = Categorias.fromJson(dataDecode);
    ListadoCategorias = eCateListRestToJson.listadoCategorias;
    notifyListeners(); //notifica a los widgets cuando hay un cambio en la data
  }

  //metodo para eliminar categoria
  Future<void> deleteCategory(int categoryId) async {
    var url = Uri.http(BASEURL, 'ejemplos/category_del_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';

    final response = await http.post(
      url,
      headers: {'authorization': basicAuth, 'Content-Type': 'application/json'},
      body: jsonEncode({'category_id': categoryId}),
    );

    print(response.body);
    if (response.statusCode == 200) {
      ListadoCategorias.removeWhere(
          (category) => category.categoryId == categoryId);
      notifyListeners();
    } else {
      print(
          'Error al eliminar categoría. Código de estado: ${response.statusCode}');
    }
  }

  //metodo para actualizar categoria
  Future<void> updateCategory(
      int categoryId, String newName, String newState) async {
    var url = Uri.http(BASEURL, 'ejemplos/category_edit_rest/');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$APIUSER:$APIPASS'))}';

    final response = await http.post(
      url,
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'category_id': categoryId,
        'category_name': newName,
        'category_state': newState,
      }),
    );

    if (response.statusCode == 200) {
      final index =
          ListadoCategorias.indexWhere((cat) => cat.categoryId == categoryId);
      if (index != -1) {
        ListadoCategorias[index].categoryName = newName;
        ListadoCategorias[index].categoryState = newState;
        notifyListeners();
      }
    } else {
      print(
          'Error al actualizar categoría. Código de estado: ${response.statusCode}');
    }
  }
}
