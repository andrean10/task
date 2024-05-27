import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_katalog/data/data_katalog_api.dart';
import 'package:recomend_toba/data_katalog/repo/data_katalog_api_service.dart';

class DataKatalogRemote {
  final DataKatalogApiService _serviceApi = DataKatalogApiService();

  Future<DataKatalogApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }
}
