import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_api.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_apidata.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataBobotApiService {
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

  Future<DataBobotApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_bobot/tampil.php",
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
        return DataBobotApi.fromJson(jsonDecode(response.data));
      }
      return DataBobotApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataBobotResultApi> prosesSimpan(DataBobot data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_bobot/proses_simpan.php",
        data: FormData.fromMap({
          'id_bobot': data.idBobot,
          'jenis_wisata': data.jenisWisata,
          'wilayah': data.wilayah,
          'rating': data.rating,
          'harga_tiket': data.hargaTiket,
          'hari_operasional': data.hariOperasional,
          'jam_operasional': data.jamOperasional,
        }),
      );
      /* if (response.data is String) {
          return DataBobotResultApi.fromJson(jsonDecode(response.data));
      }
      return DataBobotResultApi.fromJson(response.data); */
      return DataBobotResultApi("success", DataBobotApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataBobotResultApi> prosesUbah(DataBobot data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_bobot/proses_update.php",
        data: FormData.fromMap({
          'id_bobot': data.idBobot,
          'jenis_wisata': data.jenisWisata,
          'wilayah': data.wilayah,
          'rating': data.rating,
          'harga_tiket': data.hargaTiket,
          'hari_operasional': data.hariOperasional,
          'jam_operasional': data.jamOperasional,
        }),
      );
      /* if (response.data is String) {
        return DataBobotResultApi.fromJson(jsonDecode(response.data));
      }
      return DataBobotResultApi.fromJson(response.data); */
      return DataBobotResultApi(
        "berhasil",
        DataBobotApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataBobotResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_bobot/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataBobotResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataBobotResultApi.fromJson(response.data); */
      return DataBobotResultApi(
        "berhasil",
        DataBobotApiData(),
      ); */
      return DataBobotResultApi("success", DataBobotApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
