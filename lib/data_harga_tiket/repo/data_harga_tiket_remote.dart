import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_api.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_result_api.dart';
import 'package:recomend_toba/data_harga_tiket/repo/data_harga_tiket_api_service.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket.dart';

class DataHargaTiketRemote {
  final DataHargaTiketApiService _serviceApi = DataHargaTiketApiService();

  Future<DataHargaTiketApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataHargaTiketResultApi> simpan(DataHargaTiket data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataHargaTiketResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataHargaTiketResultApi> ubah(DataHargaTiket data) {
    return _serviceApi.prosesUbah(data);
  }
}
