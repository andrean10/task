import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_jam_operasional_apidata.g.dart';

@JsonSerializable()
class DataJamOperasionalApiData implements DataHapus {
  DataJamOperasionalApiData({
    this.idJamOperasional,
    this.jamOperasional,
    this.nilai,
  });

  @JsonKey(name: "id_jam_operasional", defaultValue: "")
  final String? idJamOperasional;
  @JsonKey(name: "jam_operasional", defaultValue: "")
  final String? jamOperasional;
  @JsonKey(name: "nilai", defaultValue: "")
  final String? nilai;

  factory DataJamOperasionalApiData.fromJson(Map<String, dynamic> json) =>
      _$DataJamOperasionalApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataJamOperasionalApiDataToJson(this);

  // copy with
  DataJamOperasionalApiData copyWith({
    String? idJamOperasional,
    String? jamOperasional,
    String? nilai,
  }) {
    return DataJamOperasionalApiData(
      idJamOperasional: idJamOperasional?? this.idJamOperasional,
      jamOperasional: jamOperasional?? this.jamOperasional,
      nilai: nilai?? this.nilai,
    );
  }

  @override
  String getIdHapus() {
    return "$idJamOperasional";
  }
}
