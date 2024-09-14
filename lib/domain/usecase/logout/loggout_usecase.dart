import 'package:absensi/data/repository/shared_pref_repository.dart';
import 'package:absensi/domain/usecase/usecase.dart';

class LogoutUsecase implements UseCase<void, void> {
  final SharedPrefRepository sharedPrefRepository;

  LogoutUsecase({required this.sharedPrefRepository});
  @override
  Future<void> call(void params) async {
    await sharedPrefRepository.removeDataLogin();
  }
}
