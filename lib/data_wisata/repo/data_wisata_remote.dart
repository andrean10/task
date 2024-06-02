import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/home/filter_pencarian.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_api.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_result_api.dart';
import 'package:recomend_toba/data_wisata/repo/data_wisata_api_service.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata.dart';

class DataWisataRemote {
  final DataWisataApiService _serviceApi = DataWisataApiService();

  Future<DataWisataApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataWisataApi> getRekomendasi(FilterPencarian filter) {
    return _serviceApi.getRekomendasi(filter);
  }

  Future<DataWisataApi> getPecarian(FilterPencarian filter) {
    return _serviceApi.getPecarian(filter);
  }

  Future<DataWisataResultApi> simpan(DataWisata data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataWisataResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataWisataResultApi> ubah(DataWisata data) {
    return _serviceApi.prosesUbah(data);
  }
}
