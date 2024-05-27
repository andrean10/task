import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_apidata.dart';

part 'data_wilayah_api.g.dart';

@JsonSerializable()
class DataWilayahApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataWilayahApiData> result;

  DataWilayahApi(this.status, this.result);

  factory DataWilayahApi.fromJson(Map<String, dynamic> json) =>
      _$DataWilayahApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataWilayahApiToJson(this);
}
