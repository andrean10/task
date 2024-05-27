import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_apidata.dart';

part 'data_jam_operasional_api.g.dart';

@JsonSerializable()
class DataJamOperasionalApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataJamOperasionalApiData> result;

  DataJamOperasionalApi(this.status, this.result);

  factory DataJamOperasionalApi.fromJson(Map<String, dynamic> json) =>
      _$DataJamOperasionalApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataJamOperasionalApiToJson(this);
}
