import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/client.dart';
import 'models/product.dart';

class DBProvider {
  DBProvider._();
  static final instance = DBProvider._();

  late final Database _database;

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    final db = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        log('db open');
      },
      onCreate: (Database db, int version) async {
        log('db create');
        await db.execute("CREATE TABLE Product ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "first_name TEXT,"
            "last_name TEXT,"
            "blocked BIT"
            ")");
        await db.execute("CREATE TABLE Client ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "first_name TEXT,"
            "last_name TEXT,"
            "blocked BIT,"
            "productId INTEGER,"
            "FOREIGN KEY (productId) REFERENCES Product (id) ON DELETE NO ACTION ON UPDATE NO ACTION)");
        log('db end create');
      },
      onConfigure: (db) async {
        log('message config');
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
    _database = db;
  }

  newClient(Client newClient) async {
    final db = _database;
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Client (first_name,last_name,blocked,productId)"
        " VALUES (?,?,?,?)",
        [
          newClient.firstName,
          newClient.lastName,
          newClient.blocked,
          newClient.product.id,
        ]);
    return raw;
  }

  newProduct(Product model) async {
    final db = _database;
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Product (first_name,last_name,blocked)"
        " VALUES (?,?,?)",
        [model.firstName, model.lastName, model.blocked]);
    return raw;
  }

  blockOrUnblock(Client client) async {
    final db = _database;
    Client blocked = Client(
      id: client.id,
      firstName: client.firstName,
      lastName: client.lastName,
      blocked: !client.blocked,
      product: client.product,
    );
    var res = await db.update("Client", blocked.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return res;
  }

  updateClient(Client newClient) async {
    final db = _database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  getClient(int id) async {
    final db = _database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  Future<List<Client>> getBlockedClients() async {
    final db = _database;

    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
    var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);

    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<Client>> getAllClients() async {
    final db = _database;
    var res =
        await db.rawQuery("SELECT c.id as c_id, c.first_name as c_first_name,"
            " c.last_name as c_last_name, c.blocked as c_blocked,"
            " p.first_name as p_first_name, p.id as p_id,"
            " p.last_name as p_last_name, p.blocked as p_blocked,"
            " c.productId as c_productId FROM Client c"
            " INNER JOIN Product p ON p.id = c.productId");
    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = _database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = _database;
    db.rawDelete("Delete * from Client");
  }
}
