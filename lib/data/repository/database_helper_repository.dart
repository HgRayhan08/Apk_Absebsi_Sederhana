import 'package:absensi/domain/entitis/data_absen.dart';
import 'package:sqflite/sqflite.dart';

abstract interface class DatabaseHelperRepository {
  // Future<Database> database();
  Future<Database> initializeDB();
  Future<List<DataAbsen>> getListAbsen();
  Future<void> insertAbsen(DataAbsen absen);
}
