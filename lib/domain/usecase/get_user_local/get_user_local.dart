import 'package:absensi/data/repository/shared_pref_repository.dart';
import 'package:absensi/domain/entitis/login.dart';
import 'package:absensi/domain/usecase/usecase.dart';

class GetUserLocalUsecase implements UseCase<Login, void> {
  final SharedPrefRepository sharedPrefRepository;

  GetUserLocalUsecase({required this.sharedPrefRepository});
  @override
  Future<Login> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    if (user != null) {
      return Login(email: user[0], password: user[1], name: user[2]);
    } else {
      return throw Exception("Failed get data user");
    }
  }
}
