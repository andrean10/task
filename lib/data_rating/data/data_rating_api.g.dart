// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_rating_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRatingApi _$DataRatingApiFromJson(Map<String, dynamic> json) =>
    DataRatingApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => DataRatingApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataRatingApiToJson(DataRatingApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
