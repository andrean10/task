// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_jenis_wisata_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataJenisWisataResultApi _$DataJenisWisataResultApiFromJson(
        Map<String, dynamic> json) =>
    DataJenisWisataResultApi(
      json['status'] as String,
      DataJenisWisataApiData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataJenisWisataResultApiToJson(
        DataJenisWisataResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
