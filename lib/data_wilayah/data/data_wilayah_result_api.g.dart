// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_wilayah_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWilayahResultApi _$DataWilayahResultApiFromJson(
        Map<String, dynamic> json) =>
    DataWilayahResultApi(
      json['status'] as String,
      DataWilayahApiData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataWilayahResultApiToJson(
        DataWilayahResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
