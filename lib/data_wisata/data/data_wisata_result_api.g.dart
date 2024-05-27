// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_wisata_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWisataResultApi _$DataWisataResultApiFromJson(Map<String, dynamic> json) =>
    DataWisataResultApi(
      json['status'] as String,
      DataWisataApiData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataWisataResultApiToJson(
        DataWisataResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
