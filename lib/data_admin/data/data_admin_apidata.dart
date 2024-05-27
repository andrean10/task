import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_admin_apidata.g.dart';

@JsonSerializable()
class DataAdminApiData implements DataHapus {
  DataAdminApiData({
    this.idAdmin,
    this.namaLengkap,
    this.username,
    this.password,
  });

  @JsonKey(name: "id_admin", defaultValue: "")
  final String? idAdmin;
  @JsonKey(name: "nama_lengkap", defaultValue: "")
  final String? namaLengkap;
  @JsonKey(name: "username", defaultValue: "")
  final String? username;
  @JsonKey(name: "password", defaultValue: "")
  final String? password;

  factory DataAdminApiData.fromJson(Map<String, dynamic> json) =>
      _$DataAdminApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataAdminApiDataToJson(this);

  @override
  String getIdHapus() {
    return "$idAdmin";
  }
}
