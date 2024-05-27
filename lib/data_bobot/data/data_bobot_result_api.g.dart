// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_bobot_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBobotResultApi _$DataBobotResultApiFromJson(Map<String, dynamic> json) =>
    DataBobotResultApi(
      json['status'] as String,
      DataBobotApiData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataBobotResultApiToJson(DataBobotResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
