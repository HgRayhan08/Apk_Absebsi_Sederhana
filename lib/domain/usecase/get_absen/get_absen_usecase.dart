import 'package:absensi/data/repository/database_helper_repository.dart';
import 'package:absensi/domain/entitis/data_absen.dart';
import 'package:absensi/domain/usecase/usecase.dart';

class GetAbsenUsecase implements UseCase<List<DataAbsen>, void> {
  final DatabaseHelperRepository databaseHelperRepository;

  GetAbsenUsecase({required this.databaseHelperRepository});
  @override
  Future<List<DataAbsen>> call(void params) async {
    final result = await databaseHelperRepository.getListAbsen();
    if (result.isNotEmpty) {
      return result;
    } else {
      return throw Exception("Error get list absen");
    }
  }
}
