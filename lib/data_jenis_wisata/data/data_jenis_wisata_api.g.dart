// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_jenis_wisata_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataJenisWisataApi _$DataJenisWisataApiFromJson(Map<String, dynamic> json) =>
    DataJenisWisataApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map(
              (e) => DataJenisWisataApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataJenisWisataApiToJson(DataJenisWisataApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
