import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';

part 'data_hari_operasional_result_api.g.dart';

@JsonSerializable()
class DataHariOperasionalResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataHariOperasionalApiData result;

  DataHariOperasionalResultApi(this.status, this.result);

  factory DataHariOperasionalResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataHariOperasionalResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataHariOperasionalResultApiToJson(this);
}
