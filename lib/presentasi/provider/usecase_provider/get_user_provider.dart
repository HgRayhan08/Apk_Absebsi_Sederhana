import 'package:absensi/domain/usecase/get_user/get_user_usecase.dart';
import 'package:absensi/presentasi/provider/repository_provider/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_provider.g.dart';

@riverpod
GetUserUsecase getUserUsecase(GetUserUsecaseRef ref) => GetUserUsecase(
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
