import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_rating/data/data_rating_api.dart';
import 'package:recomend_toba/data_rating/data/data_rating_result_api.dart';
import 'package:recomend_toba/data_rating/repo/data_rating_api_service.dart';
import 'package:recomend_toba/data_rating/data/data_rating.dart';

class DataRatingRemote {
  final DataRatingApiService _serviceApi = DataRatingApiService();

  Future<DataRatingApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataRatingResultApi> simpan(DataRating data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataRatingResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataRatingResultApi> ubah(DataRating data) {
    return _serviceApi.prosesUbah(data);
  }
}
