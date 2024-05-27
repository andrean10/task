import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_api.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_apidata.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataWilayahApiService {
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

  Future<DataWilayahApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wilayah/tampil.php",
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
        return DataWilayahApi.fromJson(jsonDecode(response.data));
      }
      return DataWilayahApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWilayahResultApi> prosesSimpan(DataWilayah data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wilayah/proses_simpan.php",
        data: FormData.fromMap({
          'id_wilayah': data.idWilayah,
          'wilayah': data.wilayah,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
          return DataWilayahResultApi.fromJson(jsonDecode(response.data));
      }
      return DataWilayahResultApi.fromJson(response.data); */
      return DataWilayahResultApi("success", DataWilayahApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWilayahResultApi> prosesUbah(DataWilayah data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wilayah/test_update.php",
        data: FormData.fromMap({
          'id_wilayah': data.idWilayah,
          // 'wilayah': data.wilayah,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
        return DataWilayahResultApi.fromJson(jsonDecode(response.data));
      }
      return DataWilayahResultApi.fromJson(response.data); */
      return DataWilayahResultApi(
        "berhasil",
        DataWilayahApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWilayahResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wilayah/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataWilayahResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataWilayahResultApi.fromJson(response.data); */
      return DataWilayahResultApi(
        "berhasil",
        DataWilayahApiData(),
      ); */
      return DataWilayahResultApi("success", DataWilayahApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
