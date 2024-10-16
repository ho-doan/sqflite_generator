import 'dart:developer';

import 'package:example/authentication_model.dart';
import 'package:example/core/models/hospital_model.dart';
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
        ClientQuery.productBlocked.equal(true)
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
      ClientQuery.blocked.equal(true),
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
        ClientQuery.productBlocked.equal(true)
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

  //#region talk func

  /// URL : /api/MstFacility/hospital-master
  Future<
      ({
        int count,
        int? updateDate,
        int? updateTime,
        List<HospitalModel> hospitals
      })> hospitalMaster({
    Conditions? conditions,
    SortHospital? sorts,

    /// limit
    int? length,

    /// offset
    int? from,
  }) async {
    final count = await HospitalModelQuery.count(_database);
    final hospitalModel = (await HospitalModelQuery.top(
      _database,
      top: 1,
      orderBy: {
        OrderBy.desc(HospitalModelQuery.updateDate),
        OrderBy.desc(HospitalModelQuery.updateTime),
      },
    ))
        .firstOrNull;

    final updateDate = hospitalModel?.updateDate;
    final updateTime = hospitalModel?.updateTime;

    final hospitals = await HospitalModelQuery.getAll(
      _database,
      where: {
        if (conditions?.searchKeyword != null)
          HospitalModelQuery.name.likeContain(conditions!.searchKeyword!),
        if (conditions?.hospitalNos != null &&
            conditions!.hospitalNos!.isNotEmpty)
          HospitalModelQuery.hospitalNo.in$(conditions.hospitalNos!),
      },
      orderBy: {
        if (sorts?.name != null) sorts!.name!,
      },
      limit: length,
      offset: from,
    );

    return (
      count: count,
      updateTime: updateTime,
      updateDate: updateDate,
      hospitals: hospitals,
    );
  }
  //#endregion
}

class Conditions {
  final String? searchKeyword;
  final List<int>? hospitalNos;

  Conditions({
    this.searchKeyword,
    this.hospitalNos,
  });
}

class SortHospital {
  final OrderBy<$HospitalModelSetArgs>? name;

  const SortHospital._({
    required this.name,
  });

  factory SortHospital.of({
    OrderByType? name,
    OrderByType? order,
  }) =>
      SortHospital._(
        name: name.of(HospitalModelQuery.name),
      );
}
