import 'package:simple_form_flutter/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

//Data Access Object

class ContatoDao{

  static const String tableSql = 'CREATE TABLE $_tableName ($_id INTEGER PRIMARY KEY, $_name TEXT, $_phone TEXT)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _phone = 'phone';
  static const String _name = 'name';

  Future<int> save(Contato contato) async{
    final Database db = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contato);

    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contactMap = {};
    contactMap[_name] = contato.nomeContato;
    contactMap[_phone] = contato.telefone;
    return contactMap;
  }

  Future<List<Contato>> findAll() async{

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);

    List<Contato> contacts = _toList(resultado);

    return contacts;
  }

  List<Contato> _toList(List<Map<String, dynamic>> resultado) {
    final List<Contato> contacts = [];
    
    for (Map<String, dynamic> map in resultado) {
    
      final Contato contact = Contato(
        map[_id], 
        map[_name], 
        map[_phone]
      );
    
      contacts.add(contact);
    }
    return contacts;
  }
}