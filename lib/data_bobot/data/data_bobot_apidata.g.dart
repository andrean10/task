// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_bobot_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBobotApiData _$DataBobotApiDataFromJson(Map<String, dynamic> json) =>
    DataBobotApiData(
      idBobot: json['id_bobot'] as String? ?? '',
      jenisWisata: json['jenis_wisata'] as String? ?? '',
      wilayah: json['wilayah'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      hargaTiket: json['harga_tiket'] as String? ?? '',
      hariOperasional: json['hari_operasional'] as String? ?? '',
      jamOperasional: json['jam_operasional'] as String? ?? '',
    );

Map<String, dynamic> _$DataBobotApiDataToJson(DataBobotApiData instance) =>
    <String, dynamic>{
      'id_bobot': instance.idBobot,
      'jenis_wisata': instance.jenisWisata,
      'wilayah': instance.wilayah,
      'rating': instance.rating,
      'harga_tiket': instance.hargaTiket,
      'hari_operasional': instance.hariOperasional,
      'jam_operasional': instance.jamOperasional,
    };
