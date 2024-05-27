import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_api.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_apidata.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_result_api.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataJenisWisataApiService {
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

  Future<DataJenisWisataApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jenis_wisata/tampil.php",
        // data: FormData.fromMap({
        //   'berdasarkan': filter.berdasarkan,
        //   'isi': filter.isi,
        //   'limit': filter.limit,
        //   'hal': filter.hal,
        //   'dari': filter.dari,
        //   'sampai': filter.sampai
        // }),
      );

      if (response.data is String) {
        return DataJenisWisataApi.fromJson(jsonDecode(response.data));
      }
      return DataJenisWisataApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataJenisWisataResultApi> prosesSimpan(DataJenisWisata data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jenis_wisata/proses_simpan.php",
        data: FormData.fromMap({
          'id_jenis_wisata': data.idJenisWisata,
          'jenis_wisata': data.jenisWisata,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
          return DataJenisWisataResultApi.fromJson(jsonDecode(response.data));
      }
      return DataJenisWisataResultApi.fromJson(response.data); */
      return DataJenisWisataResultApi("success", DataJenisWisataApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataJenisWisataResultApi> prosesUbah(DataJenisWisata data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jenis_wisata/test_update.php",
        data: FormData.fromMap({
          'id_jenis_wisata': data.idJenisWisata,
          // 'jenis_wisata': data.jenisWisata,
          'nilai': data.nilai,
        }),
      );
      /* if (response.data is String) {
        return DataJenisWisataResultApi.fromJson(jsonDecode(response.data));
      }
      return DataJenisWisataResultApi.fromJson(response.data); */
      return DataJenisWisataResultApi(
        "berhasil",
        DataJenisWisataApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataJenisWisataResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_jenis_wisata/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataJenisWisataResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataJenisWisataResultApi.fromJson(response.data); */
      return DataJenisWisataResultApi(
        "berhasil",
        DataJenisWisataApiData(),
      ); */
      return DataJenisWisataResultApi("success", DataJenisWisataApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
