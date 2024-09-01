import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'processo.dart';

class Repository {
  Database? _database;

  Future<void> initialize() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'processos.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE processos(numeroProcesso TEXT PRIMARY KEY, status TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertProcesso(Processo processo) async {
    final db = _database;
    if (db != null) {
      await db.insert(
        'processos',
        {'numeroProcesso': processo.numeroProcesso, 'status': processo.status},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<Processo?> getProcesso(String numeroProcesso) async {
    final db = _database;
    if (db != null) {
      final List<Map<String, dynamic>> maps = await db.query(
        'processos',
        where: 'numeroProcesso = ?',
        whereArgs: [numeroProcesso],
      );

      if (maps.isNotEmpty) {
        return Processo(
          numeroProcesso: maps.first['numeroProcesso'],
          status: maps.first['status'],
        );
      }
    }
    return null;
  }

  Future<void> updateProcesso(Processo processo) async {
    final db = _database;
    if (db != null) {
      await db.update(
        'processos',
        {'status': processo.status},
        where: 'numeroProcesso = ?',
        whereArgs: [processo.numeroProcesso],
      );
    }
  }

  Future<void> deleteProcesso(String numeroProcesso) async {
    final db = _database;
    if (db != null) {
      await db.delete(
        'processos',
        where: 'numeroProcesso = ?',
        whereArgs: [numeroProcesso],
      );
    }
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
    }
  }
}
