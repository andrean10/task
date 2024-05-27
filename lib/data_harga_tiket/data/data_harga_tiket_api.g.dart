// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_harga_tiket_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHargaTiketApi _$DataHargaTiketApiFromJson(Map<String, dynamic> json) =>
    DataHargaTiketApi(
      json['status'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => DataHargaTiketApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHargaTiketApiToJson(DataHargaTiketApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
