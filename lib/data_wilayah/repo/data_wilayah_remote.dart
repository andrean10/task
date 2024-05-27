import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_api.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_result_api.dart';
import 'package:recomend_toba/data_wilayah/repo/data_wilayah_api_service.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah.dart';

class DataWilayahRemote {
  final DataWilayahApiService _serviceApi = DataWilayahApiService();

  Future<DataWilayahApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataWilayahResultApi> simpan(DataWilayah data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataWilayahResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataWilayahResultApi> ubah(DataWilayah data) {
    return _serviceApi.prosesUbah(data);
  }
}
