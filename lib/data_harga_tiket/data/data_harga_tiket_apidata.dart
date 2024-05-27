import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_harga_tiket_apidata.g.dart';

@JsonSerializable()
class DataHargaTiketApiData implements DataHapus {
  DataHargaTiketApiData({
    this.idHargaTiket,
    this.hargaTiket,
    this.nilai,
  });

  @JsonKey(name: "id_harga_tiket", defaultValue: "")
  final String? idHargaTiket;
  @JsonKey(name: "harga_tiket", defaultValue: "")
  final String? hargaTiket;
  @JsonKey(name: "nilai", defaultValue: "")
  final String? nilai;

  factory DataHargaTiketApiData.fromJson(Map<String, dynamic> json) =>
      _$DataHargaTiketApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataHargaTiketApiDataToJson(this);

  DataHargaTiketApiData copyWith({
    String? idHargaTiket,
    String? hargaTiket,
    String? nilai,
  }) {
    return DataHargaTiketApiData(
      idHargaTiket: idHargaTiket?? this.idHargaTiket,
      hargaTiket: hargaTiket?? this.hargaTiket,
      nilai: nilai?? this.nilai,
    );
  }


  @override
  String getIdHapus() {
    return "$idHargaTiket";
  }
}
