// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_wisata_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWisataApi _$DataWisataApiFromJson(Map<String, dynamic> json) =>
    DataWisataApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => DataWisataApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataWisataApiToJson(DataWisataApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
