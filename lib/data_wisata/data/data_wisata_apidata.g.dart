// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_wisata_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWisataApiData _$DataWisataApiDataFromJson(Map<String, dynamic> json) =>
    DataWisataApiData(
      idWisata: json['id_wisata'] as String? ?? '',
      namaWisata: json['nama_wisata'] as String? ?? '',
      foto: json['foto'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
      koordinat: json['koordinat'] as String? ?? '',
      idJenisWisata: json['id_jenis_wisata'] as String? ?? '',
      idWilayah: json['id_wilayah'] as String? ?? '',
      idRating: json['id_rating'] as String? ?? '',
      idHargaTiket: json['id_harga_tiket'] as String? ?? '',
      idHariOperasional: json['id_hari_operasional'] as String? ?? '',
      idJamOperasional: json['id_jam_operasional'] as String? ?? '',
      jenisWisata: json['jenis_wisata'] as String? ?? '',
      wilayah: json['wilayah'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      hargaTiket: json['harga_tiket'] as String? ?? '',
      hariOperasional: json['hari_operasional'] as String? ?? '',
      jamOperasional: json['jam_operasional'] as String? ?? '',
      score: json['score'] as double? ?? 0,
    );

Map<String, dynamic> _$DataWisataApiDataToJson(DataWisataApiData instance) =>
    <String, dynamic>{
      'id_wisata': instance.idWisata,
      'nama_wisata': instance.namaWisata,
      'foto': instance.foto,
      'deskripsi': instance.deskripsi,
      'koordinat': instance.koordinat,
      'id_jenis_wisata': instance.idJenisWisata,
      'id_wilayah': instance.idWilayah,
      'id_rating': instance.idRating,
      'id_harga_tiket': instance.idHargaTiket,
      'id_hari_operasional': instance.idHariOperasional,
      'id_jam_operasional': instance.idJamOperasional,
      'jenis_wisata': instance.jenisWisata,
      'wilayah': instance.wilayah,
      'rating': instance.rating,
      'harga_tiket': instance.hargaTiket,
      'hari_operasional': instance.hariOperasional,
      'jam_operasional': instance.jamOperasional,
      'score': instance.score,
    };
