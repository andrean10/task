import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_apidata.dart';

part 'data_jenis_wisata_result_api.g.dart';

@JsonSerializable()
class DataJenisWisataResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataJenisWisataApiData result;

  DataJenisWisataResultApi(this.status, this.result);

  factory DataJenisWisataResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataJenisWisataResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataJenisWisataResultApiToJson(this);
}
