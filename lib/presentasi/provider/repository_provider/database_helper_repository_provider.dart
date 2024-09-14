import 'package:absensi/data/database_helper/database_helper.dart';
import 'package:absensi/data/repository/database_helper_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_helper_repository_provider.g.dart';

@riverpod
DatabaseHelperRepository databaseHelperRepository(
        DatabaseHelperRepositoryRef ref) =>
    DatabaseHelper();
