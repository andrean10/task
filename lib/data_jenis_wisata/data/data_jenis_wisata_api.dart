import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_apidata.dart';

part 'data_jenis_wisata_api.g.dart';

@JsonSerializable()
class DataJenisWisataApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataJenisWisataApiData> result;

  DataJenisWisataApi(this.status, this.result);

  factory DataJenisWisataApi.fromJson(Map<String, dynamic> json) =>
      _$DataJenisWisataApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataJenisWisataApiToJson(this);
}
