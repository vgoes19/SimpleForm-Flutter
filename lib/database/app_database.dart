import 'package:path/path.dart';
import 'package:simple_form_flutter/models/contato.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{

  final String path = join(await getDatabasesPath(), 'simpleForm.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'phone TEXT)'
    );
  }, version: 1);


  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'simpleForm.db');
  //   return openDatabase(path, onCreate: (db, version) {

  //     db.execute('CREATE TABLE contacts('
  //       'id INTEGER PRIMARY KEY, '
  //       'name TEXT, '
  //       'phone TEXT)'
  //     );
  //   }, version: 1); //onDowngrade: onDatabaseDowngradeDelete
  // });
}




Future<int> save(Contato contato) async{
  final Database db = await getDatabase();

  final Map<String, dynamic> contactMap = {};
  contactMap['name'] = contato.nomeContato;
  contactMap['phone'] = contato.telefone;

  return db.insert('contacts', contactMap);

  // return getDatabase().then((db) {
  //   final Map<String, dynamic> contactMap = {};
  //   //contactMap['id'] = contato.id;
  //   contactMap['name'] = contato.nomeContato;
  //   contactMap['phone'] = contato.telefone;

  //   return db.insert('contacts', contactMap);
  // });
}

Future<List<Contato>> findAll() async{

  final Database db = await getDatabase();
  final List<Map<String, dynamic>> resultado = await db.query('contacts');

  final List<Contato> contacts = [];

  for (Map<String, dynamic> map in resultado) {

    final Contato contact = Contato(
      map['id'], 
      map['name'], 
      map['phone']
    );

    contacts.add(contact);
  }

  return contacts;


  // return getDatabase().then((db) {
  //   return db.query('contacts').then((maps) {

  //     final List<Contato> contacts = [];

  //     for (Map<String, dynamic> map in maps) {

  //       final Contato contact = Contato(
  //         map['id'], 
  //         map['name'], 
  //         map['phone']
  //       );
  //       contacts.add(contact);
  //     }

  //     return contacts;
  //   });
  // });
}