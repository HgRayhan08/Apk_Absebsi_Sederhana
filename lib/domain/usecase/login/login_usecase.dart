import 'package:absensi/data/repository/shared_pref_repository.dart';
import 'package:absensi/domain/usecase/login/login_params.dart';
import 'package:absensi/domain/usecase/usecase.dart';

class LoginUsecase implements UseCase<bool, LoginParams> {
  final SharedPrefRepository sharedPrefRepository;

  LoginUsecase({required this.sharedPrefRepository});

  @override
  Future<bool> call(LoginParams params) async {
    var login = await sharedPrefRepository.saveDataLogin(
      {
        params.email,
        params.password,
        params.name,
      }.toList(),
    );
    if (login == true) {
      return login;
    } else {
      return false;
    }
  }
}
