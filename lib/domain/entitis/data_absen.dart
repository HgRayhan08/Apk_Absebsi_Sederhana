import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_absen.freezed.dart';
part 'data_absen.g.dart';

@freezed
class DataAbsen with _$DataAbsen {
  factory DataAbsen({
    required String id,
    required String name,
    required double lat,
    required double long,
    required String alamat,
    required String dateTime,
  }) = _DataAbsen;

  factory DataAbsen.fromJson(Map<String, dynamic> json) =>
      _$DataAbsenFromJson(json);
}
