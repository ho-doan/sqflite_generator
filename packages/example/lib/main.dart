import 'dart:async';
import 'dart:developer';

import 'package:example/authentication_model.dart';
import 'package:example/db/models/bill.dart';
import 'package:example/db/models/client.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart' hide Column;

import 'db/models/product.dart';

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
          BillSetArgs.$product.$firstName,
          BillSetArgs.productId,
          BillSetArgs.clientId,
          BillSetArgs.$client.$id,
          BillSetArgs.$product.$id,
          BillSetArgs.$client.$$product.$id,
          BillSetArgs.$client.$productId,
          BillSetArgs.$client.$firstName,
          BillSetArgs.$client.$lastName,
          BillSetArgs.$client.$blocked,
          BillSetArgs.time,
          // BillSetArgs.productId,
          // BillSetArgs.clientId,
          // BillSetArgs.clientProductId,
          // BillSetArgs.time,
          // BillSetArgs.$client.$blocked,
          // BillSetArgs.$product.$firstName,
          // BillSetArgs.$client.$$product.$firstName,
          // BillSetArgs.$clientParent.$lastName,
          // BillSetArgs.$clientParent.$$product.$firstName,
          BillSetArgs.$client.$$product.$firstName,
          BillSetArgs.$parent.$$client.$$product.$firstName,
          // ClientSetArgs.firstName,
          // ClientSetArgs.lastName,
          // ClientSetArgs.blocked,
          // ClientSetArgs.id,
          // ClientSetArgs.productId,
          // ClientSetArgs.$product.$firstName,
          // ClientSetArgs.$product.$lastName,
          // ClientSetArgs.$product.$id,
          // ClientSetArgs.$product.$blocked,
        },
        // where: {
        //   BillSetArgs.productId.equal(1),
        //   // BillSetArgs.$product.$id.equal(1),
        // },
        // whereOr: [
        //   {
        //     BillSetArgs.productId.equal(1),
        //     BillSetArgs.$product.$firstName.equal('1'),
        //     BillSetArgs.$client.$$product.$lastName.likeContain('11'),
        //   },
        // ],
      ).then(
        (v) => setState(() {
          bills = v;
        }),
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
            for (final b in bills)
              Text(
                  'product_id: ${b.product?.id} client_id: ${b.client?.id} client_product_id: ${b.client?.product?.id}'),
            // for (final item in bills)
            //   Text('${item.name} ${item.details.map((e) => e.name)}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bill = Bill(
            product: Product(
              id: 12,
              firstName: 'test',
              lastName: 'tes4t',
              blocked: false,
            ),
            client: Client(
              id: 1,
              firstName: 'test',
              lastName: 'test',
              blocked: false,
              product: Product(
                id: 2,
                firstName: 'test',
                lastName: 'test',
                blocked: false,
              ),
            ),
            clientParent: Client(
              id: 3,
              firstName: 'test',
              lastName: 'test',
              blocked: false,
              product: Product(
                id: 4,
                firstName: 'test',
                lastName: 'test',
                blocked: false,
              ),
            ),
            parent: Bill(
              client: Client(
                id: 5,
                firstName: 'test',
                lastName: 'test',
                blocked: false,
                product: Product(
                  id: 6,
                  firstName: 'test',
                  lastName: 'test',
                  blocked: false,
                ),
              ),
              product: Product(
                id: 7,
                firstName: 'test',
                lastName: 'test',
                blocked: false,
              ),
              time: DateTime.now(),
            ),
            time: DateTime.now(),
          );
          await bill.product?.insert(database);
          await bill.client?.insert(database);

          await bill.clientParent?.product.insert(database);
          await bill.clientParent?.insert(database);

          await bill.parent?.client?.product.insert(database);
          await bill.parent?.client?.insert(database);

          await bill.parent?.insert(database);
          await bill.insert(database);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
