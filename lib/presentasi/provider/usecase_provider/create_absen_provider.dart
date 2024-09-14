import 'package:absensi/domain/usecase/create_absen/create_absen_usecase.dart';
import 'package:absensi/presentasi/provider/repository_provider/database_helper_repository_provider.dart';
import 'package:absensi/presentasi/provider/repository_provider/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_absen_provider.g.dart';

@riverpod
CreateAbsenUsecase createAbsenUsecase(CreateAbsenUsecaseRef ref) =>
    CreateAbsenUsecase(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
        databaseHelperRepository: ref.watch(databaseHelperRepositoryProvider));
