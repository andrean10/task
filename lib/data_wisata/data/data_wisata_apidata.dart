import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_wisata_apidata.g.dart';

@JsonSerializable()
class DataWisataApiData implements DataHapus {
  DataWisataApiData({
    this.idWisata,
    this.namaWisata,
    this.foto,
    this.deskripsi,
    this.koordinat,
    this.idJenisWisata,
    this.idWilayah,
    this.idRating,
    this.idHargaTiket,
    this.idHariOperasional,
    this.idJamOperasional,
    this.jenisWisata,
    this.wilayah,
    this.rating,
    this.hargaTiket,
    this.hariOperasional,
    this.jamOperasional,
    this.score,
  });

  @JsonKey(name: "id_wisata", defaultValue: "")
  final String? idWisata;
  @JsonKey(name: "nama_wisata", defaultValue: "")
  final String? namaWisata;
  @JsonKey(name: "foto", defaultValue: "")
  final String? foto;
  @JsonKey(name: "deskripsi", defaultValue: "")
  final String? deskripsi;
  @JsonKey(name: "koordinat", defaultValue: "")
  final String? koordinat;
  @JsonKey(name: "id_jenis_wisata", defaultValue: "")
  final String? idJenisWisata;
  @JsonKey(name: "id_wilayah", defaultValue: "")
  final String? idWilayah;
  @JsonKey(name: "id_rating", defaultValue: "")
  final String? idRating;
  @JsonKey(name: "id_harga_tiket", defaultValue: "")
  final String? idHargaTiket;
  @JsonKey(name: "id_hari_operasional", defaultValue: "")
  final String? idHariOperasional;
  @JsonKey(name: "id_jam_operasional", defaultValue: "")
  final String? idJamOperasional;

  @JsonKey(name: "jenis_wisata", defaultValue: "")
  final String? jenisWisata;

  @JsonKey(name: "wilayah", defaultValue: "")
  final String? wilayah;

  @JsonKey(name: "rating", defaultValue: "")
  final String? rating;

  @JsonKey(name: "harga_tiket", defaultValue: "")
  final String? hargaTiket;

  @JsonKey(name: "hari_operasional", defaultValue: "")
  final String? hariOperasional;

  @JsonKey(name: "jam_operasional", defaultValue: "")
  final String? jamOperasional;

  @JsonKey(name: "score", defaultValue: 0)
  final double? score;

  factory DataWisataApiData.fromJson(Map<String, dynamic> json) =>
      _$DataWisataApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataWisataApiDataToJson(this);

  @override
  String getIdHapus() {
    return "$idWisata";
  }
}
