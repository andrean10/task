import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_apidata.dart';

part 'data_bobot_result_api.g.dart';

@JsonSerializable()
class DataBobotResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataBobotApiData result;

  DataBobotResultApi(this.status, this.result);

  factory DataBobotResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataBobotResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataBobotResultApiToJson(this);
}
