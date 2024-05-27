import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';

part 'data_hari_operasional_api.g.dart';

@JsonSerializable()
class DataHariOperasionalApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataHariOperasionalApiData> result;

  DataHariOperasionalApi(this.status, this.result);

  factory DataHariOperasionalApi.fromJson(Map<String, dynamic> json) =>
      _$DataHariOperasionalApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataHariOperasionalApiToJson(this);
}
