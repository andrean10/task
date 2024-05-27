// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_rating_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRatingResultApi _$DataRatingResultApiFromJson(Map<String, dynamic> json) =>
    DataRatingResultApi(
      json['status'] as String,
      DataRatingApiData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataRatingResultApiToJson(
        DataRatingResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
