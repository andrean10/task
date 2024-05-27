import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_hari_operasional_apidata.g.dart';

@JsonSerializable()
class DataHariOperasionalApiData implements DataHapus {
  DataHariOperasionalApiData({
    this.idHariOperasional,
    this.hariOperasional,
    this.nilai,
  });

  @JsonKey(name: "id_hari_operasional", defaultValue: "")
  final String? idHariOperasional;
  @JsonKey(name: "hari_operasional", defaultValue: "")
  final String? hariOperasional;
  @JsonKey(name: "nilai", defaultValue: "")
  final String? nilai;

  factory DataHariOperasionalApiData.fromJson(Map<String, dynamic> json) =>
      _$DataHariOperasionalApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataHariOperasionalApiDataToJson(this);

  DataHariOperasionalApiData copyWith({
    String? idHariOperasional,
    String? hariOperasional,
    String? nilai,
  }) {
    return DataHariOperasionalApiData(
      idHariOperasional: idHariOperasional ?? this.idHariOperasional,
      hariOperasional: hariOperasional ?? this.hariOperasional,
      nilai: nilai ?? this.nilai,
    );
  }

  @override
  String getIdHapus() {
    return "$idHariOperasional";
  }
}
