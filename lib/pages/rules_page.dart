import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pravidla"),
      ),
      body: const Center(
        child: Text(
            """My lorem ipsum: If you are writing an app that needs to persist and query large amounts of data on the local device, consider using a database instead of a local file or key-value store. In general, databases provide faster inserts, updates, and queries compared to other local persistence solutions. Flutter apps can make use of the SQLite databases via the sqflite plugin available on pub.dev. This recipe demonstrates the basics of using sqflite to insert, read, update, and remove data about various Dogs. If you are new to SQLite and SQL statements, review the SQLite Tutorial to learn the basics before completing this recipe."""),
      ),
    );
  }
}
