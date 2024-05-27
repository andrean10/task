import 'package:json_annotation/json_annotation.dart';

part 'login_result_api.g.dart';

@JsonSerializable()
class LoginResultApi {
  LoginResultApi();

  factory LoginResultApi.fromJson(Map<String, dynamic> json) =>
      _$LoginResultApiFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResultApiToJson(this);
}

/* import 'package:recomend_toba/data_siswa/data/data_siswa_api.dart';
import 'package:recomend_toba/data_siswa/data/data_siswa_apidata.dart';

part 'login_result_api.g.dart';

@JsonSerializable()
class LoginResultApi extends DataSiswaApi {

  LoginResultApi(super.status, super.result);
  
  factory LoginResultApi.fromJson(Map<String, dynamic> json) =>
      _$LoginResultApiFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResultApiToJson(this);
} */
