import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_apidata.dart';

part 'data_wilayah_result_api.g.dart';

@JsonSerializable()
class DataWilayahResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataWilayahApiData result;

  DataWilayahResultApi(this.status, this.result);

  factory DataWilayahResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataWilayahResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataWilayahResultApiToJson(this);
}
