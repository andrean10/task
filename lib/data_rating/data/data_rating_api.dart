import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_rating/data/data_rating_apidata.dart';

part 'data_rating_api.g.dart';

@JsonSerializable()
class DataRatingApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataRatingApiData> result;

  DataRatingApi(this.status, this.result);

  factory DataRatingApi.fromJson(Map<String, dynamic> json) =>
      _$DataRatingApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataRatingApiToJson(this);
}
