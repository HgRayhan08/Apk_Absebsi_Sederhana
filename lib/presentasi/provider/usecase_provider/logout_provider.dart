import 'package:absensi/domain/usecase/logout/loggout_usecase.dart';
import 'package:absensi/presentasi/provider/repository_provider/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
LogoutUsecase logoutUsecase(LogoutUsecaseRef ref) => LogoutUsecase(
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
