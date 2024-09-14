import 'package:absensi/data/repository/shared_pref_repository.dart';
import 'package:absensi/data/shared_pref/shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_pref_repository_provider.g.dart';

@riverpod
SharedPrefRepository sharedPrefRepository(SharedPrefRepositoryRef ref) =>
    SharedPreference();
