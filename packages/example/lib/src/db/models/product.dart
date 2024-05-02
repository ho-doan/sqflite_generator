import 'dart:convert';

Product productFromJson(String str) {
  final jsonData = json.decode(str);
  return Product.fromMap(jsonData);
}

String productToJson(Product data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Product {
  final int? id;
  final String firstName;
  final String lastName;
  final bool blocked;

  Product({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.blocked,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["p_id"],
        firstName: json["p_first_name"],
        lastName: json["p_last_name"],
        blocked: json["p_blocked"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "blocked": blocked,
      };
}
