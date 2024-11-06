import 'dart:developer';

import 'package:example/authentication_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'models/client.dart';

class DBProvider {
  DBProvider._();
  static final instance = DBProvider._();

  late final Database _database;

  Future<void> initDB() async {
    final db = await configSql();
    log('done init config');
    _database = db;
  }

  newClient(Client newClient) async {
    final db = _database;
    await newClient.insert(db);
  }

  Future<void> sort() async {
    ClientQuery.getAll(
      _database,
      where: {
        ClientSetArgs.lastName.equal('k'),
        ClientSetArgs.$product.$blocked.equal(true)
      },
    );
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
    var res = await blocked.update(db);
    return res;
  }

  updateClient(Client newClient) async {
    final db = _database;
    var res = await newClient.update(db);
    return res;
  }

  getClient(int id, int productId) async {
    final db = _database;
    return ClientQuery.getById(db, id, productId);
  }

  Future<List<Client>> getBlockedClients() async {
    final db = _database;

    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
    var res = await ClientQuery.getAll(db, where: {
      ClientSetArgs.blocked.equal(true),
    });

    List<Client> list = res;
    return list;
  }

  Future<List<Client>> getAllClients() async {
    final db = _database;
    log('get all----');
    return await ClientQuery.getAll(
      db,
      select: {
        ClientSetArgs.id,
        ClientSetArgs.blocked,
        ClientSetArgs.$product.$lastName,
        ClientSetArgs.$product.$id,
      },
      where: {
        ClientSetArgs.lastName.equal('k'),
        ClientSetArgs.$product.$blocked.equal(true)
      },
    );
  }

  deleteClient(int id, int productId) async {
    final db = _database;
    return await ClientQuery.deleteById(db, id, productId);
  }

  deleteAll() async {
    final db = _database;
    return await ClientQuery.deleteAll(db);
  }
}
