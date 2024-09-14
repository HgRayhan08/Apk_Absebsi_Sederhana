import 'package:absensi/domain/usecase/login/login_usecase.dart';
import 'package:absensi/presentasi/provider/repository_provider/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "login_usecase.g.dart";

@riverpod
LoginUsecase loginUsecase(LoginUsecaseRef ref) =>
    LoginUsecase(sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
