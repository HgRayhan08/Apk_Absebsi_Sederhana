import 'package:absensi/domain/usecase/get_absen/get_absen_usecase.dart';
import 'package:absensi/presentasi/provider/repository_provider/database_helper_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_absen_provider.g.dart';

@riverpod
GetAbsenUsecase getAbsenUsecase(GetAbsenUsecaseRef ref) => GetAbsenUsecase(
    databaseHelperRepository: ref.watch(databaseHelperRepositoryProvider));
