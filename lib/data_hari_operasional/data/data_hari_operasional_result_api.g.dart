// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_hari_operasional_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHariOperasionalResultApi _$DataHariOperasionalResultApiFromJson(
        Map<String, dynamic> json) =>
    DataHariOperasionalResultApi(
      json['status'] as String,
      DataHariOperasionalApiData.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataHariOperasionalResultApiToJson(
        DataHariOperasionalResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
