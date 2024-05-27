import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_apidata.dart';

part 'data_jam_operasional_result_api.g.dart';

@JsonSerializable()
class DataJamOperasionalResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataJamOperasionalApiData result;

  DataJamOperasionalResultApi(this.status, this.result);

  factory DataJamOperasionalResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataJamOperasionalResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataJamOperasionalResultApiToJson(this);
}
