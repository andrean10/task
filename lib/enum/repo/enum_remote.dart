import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/enum/data/enum_api.dart';
import 'package:recomend_toba/enum/repo/enum_api_service.dart';

class EnumRemote {
  final EnumApiService _serviceApi = EnumApiService();

  Future<EnumApi> getData(String tabel, String field) {
    return _serviceApi.getData(tabel, field);
  }
}
