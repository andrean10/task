import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_apidata.dart';

part 'data_bobot_api.g.dart';

@JsonSerializable()
class DataBobotApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataBobotApiData> result;

  DataBobotApi(this.status, this.result);

  factory DataBobotApi.fromJson(Map<String, dynamic> json) =>
      _$DataBobotApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataBobotApiToJson(this);
}
