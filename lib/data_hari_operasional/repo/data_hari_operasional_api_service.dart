import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_api.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataHariOperasionalApiService {
  Future<Dio> get dio => _buildDio();
  Future<Dio> _buildDio() async {
    var token = await ConfigSessionManager.getInstance().getToken();

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

  Future<DataHariOperasionalApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_hari_operasional/tampil.php",
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
        return DataHariOperasionalApi.fromJson(jsonDecode(response.data));
      }
      return DataHariOperasionalApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataHariOperasionalResultApi> prosesSimpan(
      DataHariOperasional data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_hari_operasional/proses_simpan.php",
        data: FormData.fromMap({
          'id_hari_operasional': data.idHariOperasional,
          'hari_operasional': data.hariOperasional,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
          return DataHariOperasionalResultApi.fromJson(jsonDecode(response.data));
      }
      return DataHariOperasionalResultApi.fromJson(response.data); */
      return DataHariOperasionalResultApi(
          "success", DataHariOperasionalApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataHariOperasionalResultApi> prosesUbah(
      DataHariOperasional data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_hari_operasional/test_update.php",
        data: FormData.fromMap({
          'id_hari_operasional': data.idHariOperasional,
          // 'hari_operasional': data.hariOperasional,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
        return DataHariOperasionalResultApi.fromJson(jsonDecode(response.data));
      }
      return DataHariOperasionalResultApi.fromJson(response.data); */
      return DataHariOperasionalResultApi(
        "berhasil",
        DataHariOperasionalApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataHariOperasionalResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_hari_operasional/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataHariOperasionalResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataHariOperasionalResultApi.fromJson(response.data); */
      return DataHariOperasionalResultApi(
        "berhasil",
        DataHariOperasionalApiData(),
      ); */
      return DataHariOperasionalResultApi(
          "success", DataHariOperasionalApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
