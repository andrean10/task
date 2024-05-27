// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_hari_operasional_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHariOperasionalApiData _$DataHariOperasionalApiDataFromJson(
        Map<String, dynamic> json) =>
    DataHariOperasionalApiData(
      idHariOperasional: json['id_hari_operasional'] as String? ?? '',
      hariOperasional: json['hari_operasional'] as String? ?? '',
      nilai: json['nilai'] as String? ?? '',
    );

Map<String, dynamic> _$DataHariOperasionalApiDataToJson(
        DataHariOperasionalApiData instance) =>
    <String, dynamic>{
      'id_hari_operasional': instance.idHariOperasional,
      'hari_operasional': instance.hariOperasional,
      'nilai': instance.nilai,
    };
