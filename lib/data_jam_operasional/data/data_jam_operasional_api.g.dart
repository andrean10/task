// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_jam_operasional_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataJamOperasionalApi _$DataJamOperasionalApiFromJson(
        Map<String, dynamic> json) =>
    DataJamOperasionalApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map((e) =>
              DataJamOperasionalApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataJamOperasionalApiToJson(
        DataJamOperasionalApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
