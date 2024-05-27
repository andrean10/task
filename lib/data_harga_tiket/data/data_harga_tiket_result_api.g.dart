// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_harga_tiket_result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHargaTiketResultApi _$DataHargaTiketResultApiFromJson(
        Map<String, dynamic> json) =>
    DataHargaTiketResultApi(
      json['status'] as String,
      DataHargaTiketApiData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataHargaTiketResultApiToJson(
        DataHargaTiketResultApi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
