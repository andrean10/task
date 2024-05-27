import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_bobot_apidata.g.dart';

@JsonSerializable()
class DataBobotApiData implements DataHapus {
  DataBobotApiData({
    this.idBobot,
    this.jenisWisata,
    this.wilayah,
    this.rating,
    this.hargaTiket,
    this.hariOperasional,
    this.jamOperasional,
  });

  @JsonKey(name: "id_bobot", defaultValue: "")
  final String? idBobot;
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

  factory DataBobotApiData.fromJson(Map<String, dynamic> json) =>
      _$DataBobotApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataBobotApiDataToJson(this);

  @override
  String getIdHapus() {
    return "$idBobot";
  }
}
