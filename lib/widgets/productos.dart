import 'dart:convert';


ProductListRest productListRestFromJson(String str) =>
    ProductListRest.fromJson(json.decode(str));

String eProductListRestToJson(ProductListRest data) =>
    json.encode(data.toJson());

class ProductListRest {
  List<Listado> listado;

  ProductListRest({
    required this.listado,
  });

  factory ProductListRest.fromJson(Map<String, dynamic> json) =>
      ProductListRest(
        listado:
            List<Listado>.from(json["Listado"].map((x) => Listado.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Listado": List<dynamic>.from(listado.map((x) => x.toJson())),
      };
}

class Listado {
  int productId;
  String productName;
  int productPrice;
  String productImage;
  String productState;

  Listado({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productState,
  });

  factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productImage: json["product_image"],
        productState: json["product_state"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "product_image": productImage,
        "product_state": productState,
      };
}
