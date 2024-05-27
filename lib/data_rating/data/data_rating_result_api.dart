import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_rating/data/data_rating_apidata.dart';

part 'data_rating_result_api.g.dart';

@JsonSerializable()
class DataRatingResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataRatingApiData result;

  DataRatingResultApi(this.status, this.result);

  factory DataRatingResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataRatingResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataRatingResultApiToJson(this);
}
