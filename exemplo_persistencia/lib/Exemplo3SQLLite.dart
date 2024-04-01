import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
      );
    },
    version: 1,
  );
  runApp(MaterialApp(
    home: MyApp(database: database),
  ));
}

class MyApp extends StatelessWidget {
  final Future<Database> database;

  MyApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: ContactList(database: database),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showAddContactDialog(context);
          await _fetchContacts();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddContactDialog(BuildContext context) async {
    String name = '';
    String email = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Contato'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (name.isNotEmpty && email.isNotEmpty) {
                  await _addContact(name, email);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addContact(String name, String email) async {
    final Database db = await database;
    await db.insert(
      'contacts',
      {'name': name, 'email': email},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> fetchContacts(Future<Database> database) async {
    final db = await database;
    final List<Map<String, dynamic>> contacts = await db.query('contacts');
    return contacts;
  }

  Future<void> _fetchContacts() async {
    await Future.delayed(Duration(milliseconds: 300)); // Pequeno atraso para garantir que o novo contato seja salvo no banco de dados
    final List<Map<String, dynamic>> contacts = await fetchContacts(database);
    // Você pode fazer algo com os contatos aqui, como atualizar o estado da interface do usuário
    print('Contatos após adicionar: $contacts');
  }
}

class ContactList extends StatelessWidget {
  final Future<Database> database;

  ContactList({required this.database});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchContacts(database),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map((contact) {
                return ListTile(
                  title: Text(contact['name']),
                  subtitle: Text(contact['email']),
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

   Future<List<Map<String, dynamic>>> fetchContacts(Future<Database> database) async {
    final db = await database;
    final List<Map<String, dynamic>> contacts = await db.query('contacts');
    return contacts;
  }
}
