import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'duvidaDAO.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath, 'help.db');
  return openDatabase(path,
    onCreate: (db, version) {
      db.execute(DuvidaDao.tableSql);
    },
    version: 1,
  );
}