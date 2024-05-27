import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';

part 'data_wisata_api.g.dart';

@JsonSerializable()
class DataWisataApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataWisataApiData> result;

  DataWisataApi(this.status, this.result);

  factory DataWisataApi.fromJson(Map<String, dynamic> json) =>
      _$DataWisataApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataWisataApiToJson(this);
}
