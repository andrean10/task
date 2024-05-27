import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_api.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_apidata.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataHargaTiketApiService {
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

  Future<DataHargaTiketApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_harga_tiket/tampil.php",
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
        return DataHargaTiketApi.fromJson(jsonDecode(response.data));
      }
      return DataHargaTiketApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataHargaTiketResultApi> prosesSimpan(DataHargaTiket data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_harga_tiket/proses_simpan.php",
        data: FormData.fromMap({
          'id_harga_tiket': data.idHargaTiket,
          'harga_tiket': data.hargaTiket,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
          return DataHargaTiketResultApi.fromJson(jsonDecode(response.data));
      }
      return DataHargaTiketResultApi.fromJson(response.data); */
      return DataHargaTiketResultApi("success", DataHargaTiketApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataHargaTiketResultApi> prosesUbah(DataHargaTiket data) async {
    debugPrint('debug: function prosesUbah dipanggil');

    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_harga_tiket/test_update.php",
        data: FormData.fromMap({
          'id_harga_tiket': data.idHargaTiket,
          // 'harga_tiket': data.hargaTiket,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
        return DataHargaTiketResultApi.fromJson(jsonDecode(response.data));
      }
      return DataHargaTiketResultApi.fromJson(response.data); */
      return DataHargaTiketResultApi(
        "berhasil",
        DataHargaTiketApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataHargaTiketResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_harga_tiket/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataHargaTiketResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataHargaTiketResultApi.fromJson(response.data); */
      return DataHargaTiketResultApi(
        "berhasil",
        DataHargaTiketApiData(),
      ); */
      return DataHargaTiketResultApi("success", DataHargaTiketApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
