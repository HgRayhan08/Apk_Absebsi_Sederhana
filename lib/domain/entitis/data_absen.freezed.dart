// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_absen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataAbsen _$DataAbsenFromJson(Map<String, dynamic> json) {
  return _DataAbsen.fromJson(json);
}

/// @nodoc
mixin _$DataAbsen {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataAbsenCopyWith<DataAbsen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataAbsenCopyWith<$Res> {
  factory $DataAbsenCopyWith(DataAbsen value, $Res Function(DataAbsen) then) =
      _$DataAbsenCopyWithImpl<$Res, DataAbsen>;
  @useResult
  $Res call(
      {String id,
      String name,
      double lat,
      double long,
      String alamat,
      String dateTime});
}

/// @nodoc
class _$DataAbsenCopyWithImpl<$Res, $Val extends DataAbsen>
    implements $DataAbsenCopyWith<$Res> {
  _$DataAbsenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lat = null,
    Object? long = null,
    Object? alamat = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataAbsenImplCopyWith<$Res>
    implements $DataAbsenCopyWith<$Res> {
  factory _$$DataAbsenImplCopyWith(
          _$DataAbsenImpl value, $Res Function(_$DataAbsenImpl) then) =
      __$$DataAbsenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double lat,
      double long,
      String alamat,
      String dateTime});
}

/// @nodoc
class __$$DataAbsenImplCopyWithImpl<$Res>
    extends _$DataAbsenCopyWithImpl<$Res, _$DataAbsenImpl>
    implements _$$DataAbsenImplCopyWith<$Res> {
  __$$DataAbsenImplCopyWithImpl(
      _$DataAbsenImpl _value, $Res Function(_$DataAbsenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lat = null,
    Object? long = null,
    Object? alamat = null,
    Object? dateTime = null,
  }) {
    return _then(_$DataAbsenImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataAbsenImpl implements _DataAbsen {
  _$DataAbsenImpl(
      {required this.id,
      required this.name,
      required this.lat,
      required this.long,
      required this.alamat,
      required this.dateTime});

  factory _$DataAbsenImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataAbsenImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double lat;
  @override
  final double long;
  @override
  final String alamat;
  @override
  final String dateTime;

  @override
  String toString() {
    return 'DataAbsen(id: $id, name: $name, lat: $lat, long: $long, alamat: $alamat, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataAbsenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, lat, long, alamat, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataAbsenImplCopyWith<_$DataAbsenImpl> get copyWith =>
      __$$DataAbsenImplCopyWithImpl<_$DataAbsenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataAbsenImplToJson(
      this,
    );
  }
}

abstract class _DataAbsen implements DataAbsen {
  factory _DataAbsen(
      {required final String id,
      required final String name,
      required final double lat,
      required final double long,
      required final String alamat,
      required final String dateTime}) = _$DataAbsenImpl;

  factory _DataAbsen.fromJson(Map<String, dynamic> json) =
      _$DataAbsenImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get lat;
  @override
  double get long;
  @override
  String get alamat;
  @override
  String get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$DataAbsenImplCopyWith<_$DataAbsenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
