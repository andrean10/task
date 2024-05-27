// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_jam_operasional_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataJamOperasionalResultApi _$DataJamOperasionalResultApiFromJson(
        Map<String, dynamic> json) =>
    DataJamOperasionalResultApi(
      json['status'] as String,
      DataJamOperasionalApiData.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataJamOperasionalResultApiToJson(
        DataJamOperasionalResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
