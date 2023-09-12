import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/Constant.dart';

class DatabaseRepository {
  Database? _database;

  static final DatabaseRepository instance = DatabaseRepository._init();
  DatabaseRepository._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('budget.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
  create table ${Constant.expenseTable} ( 
   id integer primary key autoincrement, 
   account text not null,
   category text not null,
   expenseNote text not null,
   date text not null,
   time text not null,
   amount text not null,
   currency text not null,   
)
''');
  }
}