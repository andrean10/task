// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_bobot_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBobotApi _$DataBobotApiFromJson(Map<String, dynamic> json) => DataBobotApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => DataBobotApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataBobotApiToJson(DataBobotApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
