import 'package:budget_track/localDb/expenseDbModel.dart';
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
   currency text not null)
  ''');
  }

  Future<void> insert({required ExpenseDbModel expenseDbModel}) async {
    try {
      final db = await database;
      db.insert(Constant.expenseTable, expenseDbModel.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ExpenseDbModel>> getAllExpense() async {
    final db = await instance.database;

    final result = await db.query(Constant.expenseTable);

    return result.map((json) => ExpenseDbModel.fromJson(json)).toList();
  }

  Future<void> delete(int id) async {
    try {
      final db = await instance.database;
      await db.delete(Constant.expenseTable, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> update(ExpenseDbModel expense) async {
    try {
      final db = await instance.database;
      db.update(
        Constant.expenseTable,
        expense.toMap(),
        where: 'id = ?',
        whereArgs: [expense.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
