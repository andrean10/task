import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_api.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_result_api.dart';
import 'package:recomend_toba/data_hari_operasional/repo/data_hari_operasional_api_service.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional.dart';

class DataHariOperasionalRemote {
  final DataHariOperasionalApiService _serviceApi =
      DataHariOperasionalApiService();

  Future<DataHariOperasionalApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataHariOperasionalResultApi> simpan(DataHariOperasional data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataHariOperasionalResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataHariOperasionalResultApi> ubah(DataHariOperasional data) {
    return _serviceApi.prosesUbah(data);
  }
}
