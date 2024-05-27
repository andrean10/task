import 'dart:convert';
import 'package:recomend_toba/home/filter_pencarian.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_api.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_result_api.dart';
import 'package:recomend_toba/home/pencarian_wisata_screen.dart';
import 'package:recomend_toba/utils/awesome_dio_interceptor.dart';

class DataWisataApiService {
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

  Future<DataWisataApi> getData(DataFilter filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wisata/tampil.php",
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
        return DataWisataApi.fromJson(jsonDecode(response.data));
      }
      return DataWisataApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWisataApi> getPecarian(FilterPencarian filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wisata/pencarian.php",
        data: FormData.fromMap({
          'berdasarkan': filter.berdasarkan,
          'isi': filter.isi,
          'limit': filter.limit,
          'hal': filter.hal,
          'dari': filter.dari,
          'sampai': filter.sampai,
          'id_jenis_wisata': filter.idJenisWisata,
          'id_wilayah': filter.idWilayah,
          'id_rating': filter.idRating,
          'id_harga_tiket': filter.idHargaTiket,
          'id_hari_operasional': filter.idHariOperasional,
          'id_jam_operasional': filter.idJamOperasional,
          // '': filter.jenisWisata,
          // '': filter.wilayah,
          // '': filter.rating,
          // '': filter.hargaTiket,
          // '': filter.hariOperasional,
          // '': filter.jamOperasional,
        }),
      );
      if (response.data is String) {
        return DataWisataApi.fromJson(jsonDecode(response.data));
      }
      return DataWisataApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWisataApi> getRekomendasi(FilterPencarian filter) async {
    var _dio = await dio;
    try {
      Response response = await _dio.get(
        "app/page/data_wisata/proses_moora.php",
        // data: FormData.fromMap({
        // 'berdasarkan': filter.berdasarkan,
        // 'isi': filter.isi,
        // 'limit': filter.limit,
        // 'hal': filter.hal,
        // 'dari': filter.dari,
        // 'sampai': filter.sampai,
        // 'id_jenis_wisata': filter.idJenisWisata,
        // 'id_wilayah': filter.idWilayah,
        // 'id_rating': filter.idRating,
        // 'id_harga_tiket': filter.idHargaTiket,
        // 'id_hari_operasional': filter.idHariOperasional,
        // 'id_jam_operasional': filter.idJamOperasional,
        // '': filter.jenisWisata,
        // '': filter.wilayah,
        // '': filter.rating,
        // '': filter.hargaTiket,
        // '': filter.hariOperasional,
        // '': filter.jamOperasional,
        // 'bobot_jenis_wisata': filter.bobotJenisWisata,
        // 'bobot_wilayah': filter.bobotWilayah,
        // 'bobot_rating': filter.bobotRating,
        // 'bobot_harga_tiket': filter.bobotHargaTiket,
        // 'bobot_hari_operasional': filter.bobotHariOperasional,
        // 'bobot_jam_operasional': filter.bobotJamOperasional,
        // }),
      );
      if (response.data is String) {
        return DataWisataApi.fromJson(jsonDecode(response.data));
      }
      return DataWisataApi.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWisataResultApi> prosesSimpan(DataWisata data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wisata/proses_simpan.php",
        data: FormData.fromMap({
          'id_wisata': data.idWisata,
          'nama_wisata': data.namaWisata,
          'foto': data.foto,
          'file_foto': MultipartFile(
            data.fileFoto!.openRead(),
            await data.fileFoto!.length(),
            filename:
                "${ConfigGlobal.generateId("UPL")}${data.fileFoto!.path.split('/').last}",
          ),
          'deskripsi': data.deskripsi,
          'koordinat': data.koordinat,
          'id_jenis_wisata': data.idJenisWisata,
          'id_wilayah': data.idWilayah,
          'id_rating': data.idRating,
          'id_harga_tiket': data.idHargaTiket,
          'id_hari_operasional': data.idHariOperasional,
          'id_jam_operasional': data.idJamOperasional,
        }),
      );
      /* if (response.data is String) {
          return DataWisataResultApi.fromJson(jsonDecode(response.data));
      }
      return DataWisataResultApi.fromJson(response.data); */
      return DataWisataResultApi("success", DataWisataApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWisataResultApi> prosesUbah(DataWisata data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wisata/proses_update.php",
        data: FormData.fromMap({
          'id_wisata': data.idWisata,
          'nama_wisata': data.namaWisata,
          'foto': data.foto,
          'file_foto': data.fileFoto == null
              ? null
              : MultipartFile(
                  data.fileFoto!.openRead(),
                  await data.fileFoto!.length(),
                  filename:
                      "${ConfigGlobal.generateId("UPL")}${data.fileFoto!.path.split('/').last}",
                ),
          'deskripsi': data.deskripsi,
          'koordinat': data.koordinat,
          'id_jenis_wisata': data.idJenisWisata,
          'id_wilayah': data.idWilayah,
          'id_rating': data.idRating,
          'id_harga_tiket': data.idHargaTiket,
          'id_hari_operasional': data.idHariOperasional,
          'id_jam_operasional': data.idJamOperasional,
        }),
      );
      /* if (response.data is String) {
        return DataWisataResultApi.fromJson(jsonDecode(response.data));
      }
      return DataWisataResultApi.fromJson(response.data); */
      return DataWisataResultApi(
        "berhasil",
        DataWisataApiData(),
      );
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DataWisataResultApi> prosesHapus(DataHapus data) async {
    var _dio = await dio;
    try {
      Response response = await _dio.post(
        "app/page/data_wisata/proses_hapus.php",
        data: FormData.fromMap({
          'proses': data.getIdHapus(),
        }),
      );
      /* if (response.data is String) {
        return DataWisataResultApi.fromJson(jsonDecode(response.data));
      }
      /* return DataWisataResultApi.fromJson(response.data); */
      return DataWisataResultApi(
        "berhasil",
        DataWisataApiData(),
      ); */
      return DataWisataResultApi("success", DataWisataApiData());
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
