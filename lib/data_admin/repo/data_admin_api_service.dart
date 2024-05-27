import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_admin/data/data_admin.dart';
import 'package:recomend_toba/data_admin/data/data_admin_api.dart';
import 'package:recomend_toba/data_admin/data/data_admin_apidata.dart';
import 'package:recomend_toba/data_admin/data/data_admin_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataAdminApiService {
  Future<Dio> get dio => _buildDio();
  Future<Dio> _buildDio() async {
    // var token = await ConfigSessionManager.getInstance().getToken();

    final options = BaseOptions(
      baseUrl: '${ConfigGlobal.baseUrl}/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: "application/json;charset=utf-8",
    );

    var dio = Dio(options);

    dio.interceptors.add(AwesomeDioInterceptor(
      logRequestTimeout: true,
      logRequestHeaders: true,
      logResponseHeaders: true,

      // Optional, defaults to the 'log' function in the 'dart:developer' package.
      logger: debugPrint,
    ));

    return dio;
  }

  Future<DataAdminApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_admin/tampil.php",
        data: FormData.fromMap({
          'berdasarkan': filter.berdasarkan,
          'isi': filter.isi,
          'limit': filter.limit,
          'hal': filter.hal,
          'dari': filter.dari,
          'sampai': filter.sampai
        }),
      );
      if (response.data is String) {
        return DataAdminApi.fromJson(jsonDecode(response.data));
      }
      return DataAdminApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataAdminResultApi> prosesSimpan(DataAdmin data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_admin/proses_simpan.php",
        data: FormData.fromMap({
          'id_admin': data.idAdmin,
          'nama_lengkap': data.namaLengkap,
          'username': data.username,
          'password': data.password,
        }),
      );
      /* if (response.data is String) {
          return DataAdminResultApi.fromJson(jsonDecode(response.data));
      }
      return DataAdminResultApi.fromJson(response.data); */
      return DataAdminResultApi("success", DataAdminApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataAdminResultApi> prosesUbah(DataAdmin data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_admin/proses_update.php",
        data: FormData.fromMap({
          'id_admin': data.idAdmin,
          'nama_lengkap': data.namaLengkap,
          'username': data.username,
          'password': data.password,
        }),
      );
      /* if (response.data is String) {
        return DataAdminResultApi.fromJson(jsonDecode(response.data));
      }
      return DataAdminResultApi.fromJson(response.data); */
      return DataAdminResultApi(
        "berhasil",
        DataAdminApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataAdminResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_admin/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataAdminResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataAdminResultApi.fromJson(response.data); */
      return DataAdminResultApi(
        "berhasil",
        DataAdminApiData(),
      ); */
      return DataAdminResultApi("success", DataAdminApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
