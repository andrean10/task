import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_apidata.dart';

part 'data_harga_tiket_api.g.dart';

@JsonSerializable()
class DataHargaTiketApi {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'result')
  final List<DataHargaTiketApiData> result;

  DataHargaTiketApi(this.status, this.result);

  factory DataHargaTiketApi.fromJson(Map<String, dynamic> json) =>
      _$DataHargaTiketApiFromJson(json);

  Map<String, dynamic> toJson() => _$DataHargaTiketApiToJson(this);
}
