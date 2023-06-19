import '../model/odeme.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tableOdeme';
  final String columnId = 'id';
  final String columnName = 'odemeturu';
  final String columnTutar = 'tutar';
  final String columnSonOdemeTarihi = 'sonodemetarihi';
  final String columnSirket= 'sirket';

  DbHelper._internal();

  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'odeme.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnName TEXT,"
        "$columnTutar TEXT,"
        "$columnSonOdemeTarihi TEXT,"
        "$columnSirket TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveOdeme(Odeme odeme) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, odeme.toMap());
  }

  Future<List?> getAllOdeme() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnName,
      columnSirket,
      columnTutar,
      columnSonOdemeTarihi
    ]);

    return result.toList();
  }

  Future<int?> updateOdeme(Odeme odeme) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, odeme.toMap(),
        where: '$columnId = ?', whereArgs: [odeme.id]);
  }

  Future<int?> deleteOdeme(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
