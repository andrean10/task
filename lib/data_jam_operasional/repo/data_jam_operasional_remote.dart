import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_api.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_result_api.dart';
import 'package:recomend_toba/data_jam_operasional/repo/data_jam_operasional_api_service.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional.dart';

class DataJamOperasionalRemote {
  final DataJamOperasionalApiService _serviceApi =
      DataJamOperasionalApiService();

  Future<DataJamOperasionalApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataJamOperasionalResultApi> simpan(DataJamOperasional data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataJamOperasionalResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataJamOperasionalResultApi> ubah(DataJamOperasional data) {
    return _serviceApi.prosesUbah(data);
  }
}
