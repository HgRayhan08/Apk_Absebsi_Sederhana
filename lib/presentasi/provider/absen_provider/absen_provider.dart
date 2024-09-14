import 'package:absensi/domain/entitis/data_absen.dart';
import 'package:absensi/domain/usecase/create_absen/create_absen_params.dart';
import 'package:absensi/domain/usecase/create_absen/create_absen_usecase.dart';
import 'package:absensi/domain/usecase/get_absen/get_absen_usecase.dart';
import 'package:absensi/presentasi/provider/usecase_provider/create_absen_provider.dart';
import 'package:absensi/presentasi/provider/usecase_provider/get_absen_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geocoding/geocoding.dart' as geo;
part 'absen_provider.g.dart';

@Riverpod(keepAlive: true)
class AbsenProvider extends _$AbsenProvider {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<Position> getCurrentLocation() async {
    try {
      // Memeriksa izin lokasi
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return Future.error('Location permissions are denied.');
        }
      }

      // Mendapatkan lokasi saat ini
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return Future.error('Error getting location: $e');
    }
  }

  Future<bool> createAbsen({required double lat, required double long}) async {
    final info = await geo.placemarkFromCoordinates(lat, long);
    final place = info[0];
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    CreateAbsenUsecase create = ref.read(createAbsenUsecaseProvider);
    var result = await create(
      CreateAbsenParams(
        lat: lat,
        long: long,
        alamat: address,
      ),
    );
    if (result == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<DataAbsen>> getList() async {
    GetAbsenUsecase getAbsen = ref.read(getAbsenUsecaseProvider);
    final list = await getAbsen(null);
    if (list.isNotEmpty) {
      return list;
    } else {
      return throw Exception("Failed create absen");
    }
  }
}
