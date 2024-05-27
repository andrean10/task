import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_api.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_apidata.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataJamOperasionalApiService {
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

  Future<DataJamOperasionalApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jam_operasional/tampil.php",
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
        return DataJamOperasionalApi.fromJson(jsonDecode(response.data));
      }
      return DataJamOperasionalApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataJamOperasionalResultApi> prosesSimpan(
      DataJamOperasional data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jam_operasional/proses_simpan.php",
        data: FormData.fromMap({
          'id_jam_operasional': data.idJamOperasional,
          'jam_operasional': data.jamOperasional,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
          return DataJamOperasionalResultApi.fromJson(jsonDecode(response.data));
      }
      return DataJamOperasionalResultApi.fromJson(response.data); */
      return DataJamOperasionalResultApi(
          "success", DataJamOperasionalApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataJamOperasionalResultApi> prosesUbah(
      DataJamOperasional data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jam_operasional/test_update.php",
        data: FormData.fromMap({
          'id_jam_operasional': data.idJamOperasional,
          // 'jam_operasional': data.jamOperasional,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
        return DataJamOperasionalResultApi.fromJson(jsonDecode(response.data));
      }
      return DataJamOperasionalResultApi.fromJson(response.data); */
      return DataJamOperasionalResultApi(
        "berhasil",
        DataJamOperasionalApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataJamOperasionalResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jam_operasional/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataJamOperasionalResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataJamOperasionalResultApi.fromJson(response.data); */
      return DataJamOperasionalResultApi(
        "berhasil",
        DataJamOperasionalApiData(),
      ); */
      return DataJamOperasionalResultApi(
          "success", DataJamOperasionalApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
