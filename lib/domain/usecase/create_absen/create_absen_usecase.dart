import 'package:absensi/data/repository/database_helper_repository.dart';
import 'package:absensi/data/repository/shared_pref_repository.dart';
import 'package:absensi/domain/entitis/data_absen.dart';
import 'package:absensi/domain/usecase/create_absen/create_absen_params.dart';
import 'package:absensi/domain/usecase/usecase.dart';
import 'package:uuid/uuid.dart';

class CreateAbsenUsecase implements UseCase<bool, CreateAbsenParams> {
  final SharedPrefRepository sharedPrefRepository;
  final DatabaseHelperRepository databaseHelperRepository;

  CreateAbsenUsecase(
      {required this.sharedPrefRepository,
      required this.databaseHelperRepository});

  @override
  Future<bool> call(CreateAbsenParams params) async {
    final user = await sharedPrefRepository.getDataLogin();
    DateTime date = DateTime.now();
    if (user!.isNotEmpty) {
      var uuid = const Uuid();
      await databaseHelperRepository.insertAbsen(
        DataAbsen(
          id: uuid.v4(),
          name: user[2],
          lat: params.lat,
          long: params.long,
          alamat: params.alamat,
          dateTime: date.toString(),
        ),
      );
      return true;
    } else {
      return false;
      // return throw Exception("Failed create absen");
    }
  }
}
