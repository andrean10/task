import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_wilayah_apidata.g.dart';

@JsonSerializable()
class DataWilayahApiData implements DataHapus {
  DataWilayahApiData({
    this.idWilayah,
    this.wilayah,
    this.nilai,
  });

  @JsonKey(name: "id_wilayah", defaultValue: "")
  final String? idWilayah;
  @JsonKey(name: "wilayah", defaultValue: "")
  final String? wilayah;
  @JsonKey(name: "nilai", defaultValue: "")
  final String? nilai;

  factory DataWilayahApiData.fromJson(Map<String, dynamic> json) =>
      _$DataWilayahApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataWilayahApiDataToJson(this);

  // copy with
  DataWilayahApiData copyWith({
    String? idWilayah,
    String? wilayah,
    String? nilai,
  }) {
    return DataWilayahApiData(
      idWilayah: idWilayah?? this.idWilayah,
      wilayah: wilayah?? this.wilayah,
      nilai: nilai?? this.nilai,
    );
  }

  @override
  String getIdHapus() {
    return "$idWilayah";
  }
}
