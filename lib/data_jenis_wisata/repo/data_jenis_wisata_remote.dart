import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_api.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_result_api.dart';
import 'package:recomend_toba/data_jenis_wisata/repo/data_jenis_wisata_api_service.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata.dart';

class DataJenisWisataRemote {
  final DataJenisWisataApiService _serviceApi = DataJenisWisataApiService();

  Future<DataJenisWisataApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataJenisWisataResultApi> simpan(DataJenisWisata data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataJenisWisataResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataJenisWisataResultApi> ubah(DataJenisWisata data) {
    return _serviceApi.prosesUbah(data);
  }
}
