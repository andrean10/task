import 'package:recomend_toba/login/data/data_login.dart';
import 'package:recomend_toba/login/data/login_api.dart';

abstract class RepoLoginInterface {
  Future<LoginApi> login(DataLogin data);
}
