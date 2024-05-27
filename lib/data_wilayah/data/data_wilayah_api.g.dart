// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_wilayah_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWilayahApi _$DataWilayahApiFromJson(Map<String, dynamic> json) =>
    DataWilayahApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => DataWilayahApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataWilayahApiToJson(DataWilayahApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
