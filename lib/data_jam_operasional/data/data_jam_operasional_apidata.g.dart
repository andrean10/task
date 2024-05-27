// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_jam_operasional_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataJamOperasionalApiData _$DataJamOperasionalApiDataFromJson(
        Map<String, dynamic> json) =>
    DataJamOperasionalApiData(
      idJamOperasional: json['id_jam_operasional'] as String? ?? '',
      jamOperasional: json['jam_operasional'] as String? ?? '',
      nilai: json['nilai'] as String? ?? '',
    );

Map<String, dynamic> _$DataJamOperasionalApiDataToJson(
        DataJamOperasionalApiData instance) =>
    <String, dynamic>{
      'id_jam_operasional': instance.idJamOperasional,
      'jam_operasional': instance.jamOperasional,
      'nilai': instance.nilai,
    };
