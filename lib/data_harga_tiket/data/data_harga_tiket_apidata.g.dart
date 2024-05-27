// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_harga_tiket_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHargaTiketApiData _$DataHargaTiketApiDataFromJson(
        Map<String, dynamic> json) =>
    DataHargaTiketApiData(
      idHargaTiket: json['id_harga_tiket'] as String? ?? '',
      hargaTiket: json['harga_tiket'] as String? ?? '',
      nilai: json['nilai'] as String? ?? '',
    );

Map<String, dynamic> _$DataHargaTiketApiDataToJson(
        DataHargaTiketApiData instance) =>
    <String, dynamic>{
      'id_harga_tiket': instance.idHargaTiket,
      'harga_tiket': instance.hargaTiket,
      'nilai': instance.nilai,
    };
