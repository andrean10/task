// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_wilayah_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWilayahApiData _$DataWilayahApiDataFromJson(Map<String, dynamic> json) =>
    DataWilayahApiData(
      idWilayah: json['id_wilayah'] as String? ?? '',
      wilayah: json['wilayah'] as String? ?? '',
      nilai: json['nilai'] as String? ?? '',
    );

Map<String, dynamic> _$DataWilayahApiDataToJson(DataWilayahApiData instance) =>
    <String, dynamic>{
      'id_wilayah': instance.idWilayah,
      'wilayah': instance.wilayah,
      'nilai': instance.nilai,
    };
