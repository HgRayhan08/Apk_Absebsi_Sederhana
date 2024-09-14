import 'package:absensi/domain/usecase/get_user_local/get_user_local.dart';
import 'package:absensi/presentasi/provider/repository_provider/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_local_provider.g.dart';

@riverpod
GetUserLocalUsecase getUserLocalUsecase(GetUserLocalUsecaseRef ref) =>
    GetUserLocalUsecase(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
