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
      firstName: "Raouf",
      lastName: "Rahiche",
      blocked: false,
      product: Product(
        firstName: "Raouf",
        lastName: "Rahiche",
        blocked: false,
      ),
    ),
    Client(
      firstName: "Zaki",
      lastName: "oun",
      blocked: true,
      product: Product(
        firstName: "Zaki",
        lastName: "oun",
        blocked: true,
      ),
    ),
    Client(
      firstName: "oussama",
      lastName: "ali",
      blocked: false,
      product: Product(
        firstName: "oussama",
        lastName: "ali",
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
                    title: Text(item.lastName),
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
          await DBProvider.instance.newProduct(rnd.product);
          await DBProvider.instance.newClient(rnd);
          setState(() {});
        },
      ),
    );
  }
}
