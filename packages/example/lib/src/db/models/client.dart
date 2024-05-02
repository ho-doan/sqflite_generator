import 'dart:convert';

import 'package:example/src/db/models/product.dart';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  final int? id;
  final String firstName;
  final String lastName;
  final bool blocked;
  final Product product;

  Client({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.blocked,
    required this.product,
  });

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json["c_id"],
        firstName: json["c_first_name"],
        lastName: json["c_last_name"],
        blocked: json["c_blocked"] == 1,
        product: Product.fromMap(json),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "blocked": blocked,
        'productId': product.id,
      };
}
