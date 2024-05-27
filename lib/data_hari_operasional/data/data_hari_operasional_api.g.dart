// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_hari_operasional_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHariOperasionalApi _$DataHariOperasionalApiFromJson(
        Map<String, dynamic> json) =>
    DataHariOperasionalApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map((e) =>
              DataHariOperasionalApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHariOperasionalApiToJson(
        DataHariOperasionalApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
