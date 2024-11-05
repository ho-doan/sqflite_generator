import 'dart:async';
import 'dart:developer';

import 'package:example/authentication_model.dart';
import 'package:example/db/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart' hide Column;

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configSql(
      null,
      [
        const MigrationModel(
          uidKey: 'uidV1',
          sqlInsert: '''INSERT INTO BillM(name) VALUES('bill 1'),('bill 2');''',
        ),
        const MigrationModel(
          uidKey: 'uidV1-detail',
          sqlInsert:
              '''INSERT INTO BillDetail(name, parent_key) VALUES('dt 1', 1),('dt 2', 1),('dt 3', 1),('dt 4', 1),('dt 5', 1),('dt 6', 2),('dt 7', 2),('dt 8', 2),('dt 9', 2);''',
        )
      ],
    );
    runApp(const MyApp());
  }, (e, s) {
    log('error app: $e', stackTrace: s);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Database database;

  List<Bill> bills = [];

  @override
  void initState() {
    configSql().then((db) {
      BillQuery.getAll(
        db,
        select: {
          BillSetArgs.productId,
          BillSetArgs.clientId,
          BillSetArgs.clientProductId,
          BillSetArgs.time,
          BillSetArgs.$client.$blocked
        },
        where: {
          BillSetArgs.productId.equal(1),
          // BillSetArgs.$product.$id.equal(1),
        },
        whereOr: [
          {
            BillSetArgs.productId.equal(1),
            BillSetArgs.$product.$firstName.equal('1'),
            BillSetArgs.$client.$$product.$lastName.likeContain('11'),
          },
        ],
      ).then(
        (v) => setState(() => bills = v),
      );
      return database = db;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // for (final item in bills)
            //   Text('${item.name} ${item.details.map((e) => e.name)}')
          ],
        ),
      ),
    );
  }
}
