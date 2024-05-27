import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_api.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_result_api.dart';
import 'package:recomend_toba/data_bobot/repo/data_bobot_api_service.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot.dart';

class DataBobotRemote {
  final DataBobotApiService _serviceApi = DataBobotApiService();

  Future<DataBobotApi> getData(DataFilter filter) {
    return _serviceApi.getData(filter);
  }

  Future<DataBobotResultApi> simpan(DataBobot data) {
    return _serviceApi.prosesSimpan(data);
  }

  Future<DataBobotResultApi> hapus(DataHapus data) {
    return _serviceApi.prosesHapus(data);
  }

  Future<DataBobotResultApi> ubah(DataBobot data) {
    return _serviceApi.prosesUbah(data);
  }
}
