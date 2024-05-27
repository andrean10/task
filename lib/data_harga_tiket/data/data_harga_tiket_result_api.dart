import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_apidata.dart';

part 'data_harga_tiket_result_api.g.dart';

@JsonSerializable()
class DataHargaTiketResultApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final DataHargaTiketApiData result;

  DataHargaTiketResultApi(this.status, this.result);

  factory DataHargaTiketResultApi.fromJson(Map<String, dynamic> json) =>
      _$DataHargaTiketResultApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataHargaTiketResultApiToJson(this);
}
