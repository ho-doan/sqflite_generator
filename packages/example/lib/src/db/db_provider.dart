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
    String path = join(documentsDirectory.path, "mm.db");
    final db = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        log('db open');
      },
      onCreate: (Database db, int version) async {
        log('db create');
        await db.execute(ProductQuery.createTable);
        await db.execute(ClientQuery.createTable);
        log('db end create');
      },
      onConfigure: (db) async {
        log('message config');
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
    log('done init config');
    _database = db;
  }

  newClient(Client newClient) async {
    final db = _database;
    await newClient.insert(db);
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
    var res = await db.update("Client", blocked.toDB(),
        where: "id = ?", whereArgs: [client.id]);
    return res;
  }

  updateClient(Client newClient) async {
    final db = _database;
    var res = await db.update("Client", newClient.toDB(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  getClient(int id) async {
    final db = _database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromDB(res.first) : null;
  }

  Future<List<Client>> getBlockedClients() async {
    final db = _database;

    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
    var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);

    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromDB(c)).toList() : [];
    return list;
  }

  Future<List<Client>> getAllClients() async {
    final db = _database;
    log('get all----');
    return await ClientQuery.getAll(db);
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
