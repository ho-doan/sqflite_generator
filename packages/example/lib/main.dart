import 'dart:convert';

import 'package:example/src/db/models/product.dart';
import 'package:flutter/material.dart';

import 'src/db/db_provider.dart';
import 'src/db/models/client.dart';
import 'dart:math' as math;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider.instance.initDB();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // data for testing
  List<Client> testClients = [
    Client(
      firstName: "i",
      lastName: "k",
      blocked: false,
      product: Product(
        id: 1,
        firstName: "l",
        lastName: "m",
        blocked: false,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter SQLite")),
      body: FutureBuilder<List<Client>>(
        future: DBProvider.instance.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data ?? [];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.instance.deleteClient(item.id!);
                  },
                  child: ListTile(
                    title: Text(jsonEncode(item.toDB())),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (value) {
                        DBProvider.instance.blockOrUnblock(item);
                        setState(() {});
                      },
                      value: item.blocked,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Client rnd = testClients[math.Random().nextInt(testClients.length)];
          await DBProvider.instance.newClient(rnd);
          // CategoryQuery.getAll(
          //   db,
          //   select: const $CategorySelectArgs(),
          // );
          setState(() {});
        },
      ),
    );
  }
}
