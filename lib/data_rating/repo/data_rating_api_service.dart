import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_rating/data/data_rating.dart';
import 'package:recomend_toba/data_rating/data/data_rating_api.dart';
import 'package:recomend_toba/data_rating/data/data_rating_apidata.dart';
import 'package:recomend_toba/data_rating/data/data_rating_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataRatingApiService {
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

  Future<DataRatingApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_rating/tampil.php",
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
        return DataRatingApi.fromJson(jsonDecode(response.data));
      }
      return DataRatingApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataRatingResultApi> prosesSimpan(DataRating data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_rating/proses_simpan.php",
        data: FormData.fromMap({
          'id_rating': data.idRating,
          'rating': data.rating,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
          return DataRatingResultApi.fromJson(jsonDecode(response.data));
      }
      return DataRatingResultApi.fromJson(response.data); */
      return DataRatingResultApi("success", DataRatingApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataRatingResultApi> prosesUbah(DataRating data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_rating/test_update.php",
        data: FormData.fromMap({
          'id_rating': data.idRating,
          // 'rating': data.rating,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
        return DataRatingResultApi.fromJson(jsonDecode(response.data));
      }
      return DataRatingResultApi.fromJson(response.data); */
      return DataRatingResultApi(
        "berhasil",
        DataRatingApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataRatingResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_rating/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataRatingResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataRatingResultApi.fromJson(response.data); */
      return DataRatingResultApi(
        "berhasil",
        DataRatingApiData(),
      ); */
      return DataRatingResultApi("success", DataRatingApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
