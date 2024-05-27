import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';

part 'data_wisata_result_api.g.dart';

@JsonSerializable()
class DataWisataResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataWisataApiData result;

  DataWisataResultApi(this.status, this.result);

  factory DataWisataResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataWisataResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataWisataResultApiToJson(this);
}
