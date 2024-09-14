// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_absen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataAbsenImpl _$$DataAbsenImplFromJson(Map<String, dynamic> json) =>
    _$DataAbsenImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      alamat: json['alamat'] as String,
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$$DataAbsenImplToJson(_$DataAbsenImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'long': instance.long,
      'alamat': instance.alamat,
      'dateTime': instance.dateTime,
    };
