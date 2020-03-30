import 'package:app_help_flutter/database/app_database.dart';
import 'package:app_help_flutter/model/duvida.dart';
import 'package:sqflite/sqflite.dart';

class DuvidaDao {
  static const String _tableName = 'duvidas';
  static const String _id = 'id';
  static const String _curso = 'curso';
  static const String _materia = 'materia';
  static const String _duvida = 'duvida';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_curso TEXT, '
      '$_materia TEXT, '
      '$_duvida TEXT)';

  Future<int> salvar(Duvida duvida) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> duvidaMap = Map();
    duvidaMap[_materia] = duvida.materia;
    duvidaMap[_curso] = duvida.curso;
    return db.insert(_tableName, duvidaMap);
  }

  Future<List<Duvida>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);
    final List<Duvida> duvidas = List();
    for (Map<String, dynamic> row in resultado) {
      final Duvida duvida = Duvida(
        row[_id],
        row[_materia],
        row[_curso],
        row[_duvida],
      );
      duvidas.add(duvida);
    }
    return duvidas;
  }

    Future<int> editar(Duvida duvida) async {
      print(duvida);
    final Database db = await getDatabase();
    final Map<String, dynamic> editar = Map();
    editar[_materia] = duvida.materia;
    editar[_curso] = duvida.curso;
    return db.update(
      _tableName,
      editar,
      where: 'id = ?',
      whereArgs: [duvida.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
