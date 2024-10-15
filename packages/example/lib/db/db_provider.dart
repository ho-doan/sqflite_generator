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
        ClientQuery.lastName.equal('k'),
        // TODO(hodoan): where boolean
        ClientQuery.productBlocked.equal('true')
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

  getClient(int id) async {
    final db = _database;
    return ClientQuery.getById(db, id);
  }

  Future<List<Client>> getBlockedClients() async {
    final db = _database;

    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
    var res = await ClientQuery.getAll(db, where: {
      ClientQuery.blocked.equal('1'),
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
        ClientQuery.id,
        ClientQuery.blocked,
        ClientQuery.productLastName,
        ClientQuery.productId,
      },
      where: {
        ClientQuery.lastName.equal('k'),
        // TODO(hodoan): where boolean
        ClientQuery.productBlocked.equal('true')
      },
    );
  }

  deleteClient(int id) async {
    final db = _database;
    return await ClientQuery.deleteById(db, id);
  }

  deleteAll() async {
    final db = _database;
    return await ClientQuery.deleteAll(db);
  }
}
