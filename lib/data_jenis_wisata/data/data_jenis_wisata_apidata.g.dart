// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_jenis_wisata_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataJenisWisataApiData _$DataJenisWisataApiDataFromJson(
        Map<String, dynamic> json) =>
    DataJenisWisataApiData(
      idJenisWisata: json['id_jenis_wisata'] as String? ?? '',
      jenisWisata: json['jenis_wisata'] as String? ?? '',
      nilai: json['nilai'] as String? ?? '',
    );

Map<String, dynamic> _$DataJenisWisataApiDataToJson(
        DataJenisWisataApiData instance) =>
    <String, dynamic>{
      'id_jenis_wisata': instance.idJenisWisata,
      'jenis_wisata': instance.jenisWisata,
      'nilai': instance.nilai,
    };
