import 'package:absensi/domain/entitis/login.dart';
import 'package:absensi/domain/usecase/get_user/get_user_usecase.dart';
import 'package:absensi/domain/usecase/get_user_local/get_user_local.dart';
import 'package:absensi/domain/usecase/login/login_params.dart';
import 'package:absensi/domain/usecase/login/login_usecase.dart';
import 'package:absensi/presentasi/provider/usecase_provider/get_user_local_provider.dart';
import 'package:absensi/presentasi/provider/usecase_provider/get_user_provider.dart';
import 'package:absensi/presentasi/provider/usecase_provider/login_usecase.dart';
import 'package:absensi/presentasi/provider/usecase_provider/logout_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<bool> build() async {
    GetUserUsecase getUser = ref.read(getUserUsecaseProvider);
    var result = await getUser(null);
    if (result == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<Login> getLocal() async {
    GetUserLocalUsecase getUser = ref.read(getUserLocalUsecaseProvider);
    var result = await getUser(null);
    if (result != null) {
      return result;
    } else {
      return throw Exception("Failed get data user");
    }
  }

  // Future<Login> getUser() async {
  //   GetUserUsecase getUser = ref.read(getUserUsecaseProvider);
  //   var result = await getUser(null);
  //   if (result == true) {
  //     return ;
  //   } else {
  //     return;
  //   }
  // }

  Future<String> login({
    required String email,
    required String password,
    required String name,
  }) async {
    LoginUsecase login = ref.read(loginUsecaseProvider);
    var result =
        await login(LoginParams(email: email, password: password, name: name));
    if (result == true) {
      state = const AsyncData(true);
      return "User";
    } else {
      return "";
    }
  }

  Future<void> logout() async {
    var logout = ref.read(logoutUsecaseProvider);
    await logout(null);
    state = const AsyncData(false);
  }
}
