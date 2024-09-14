import 'package:absensi/data/repository/database_helper_repository.dart';
import 'package:absensi/domain/entitis/data_absen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper implements DatabaseHelperRepository {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await initializeDB();
    return _database;
  }

  final String _tableName = 'tbl_absen';

  @override
  Future<List<DataAbsen>> getListAbsen() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results
        .map(
          (e) => DataAbsen(
            id: e["id"],
            name: e["name"],
            lat: e["lat"],
            long: e["long"],
            alamat: e["alamat"],
            dateTime: e["dateTime"],
          ),
        )
        .toList();
  }

  @override
  Future<Database> initializeDB() async {
    var db = openDatabase(
        join(
          await getDatabasesPath(),
          'absen_db.db',
        ), onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tableName(id TEXT PRIMARY KEY, lat REAL, long REAL, name TEXT, alamat TEXT, dateTime TEXT)''',
      );
    }, version: 1);

    return db;
  }

  @override
  Future<void> insertAbsen(DataAbsen absen) async {
    final db = await database;

    await db.insert(
      _tableName,
      absen.toJson(),
    );
  }
}
