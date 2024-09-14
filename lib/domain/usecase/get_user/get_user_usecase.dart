import 'package:absensi/data/repository/shared_pref_repository.dart';
import 'package:absensi/domain/usecase/usecase.dart';

class GetUserUsecase implements UseCase<bool, void> {
  final SharedPrefRepository sharedPrefRepository;

  GetUserUsecase({required this.sharedPrefRepository});
  @override
  Future<bool> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
