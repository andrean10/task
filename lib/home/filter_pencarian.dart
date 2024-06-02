import 'package:flutter/material.dart';
import 'package:recomend_toba/data/data_filter.dart';

class FilterPencarian extends DataFilter {
  final String berdasarkan;
  final String isi;
  final String limit;
  final String hal;
  final String dari;
  final String sampai;
  final String auth;
  final String idPeserta;

  String? idJenisWisata = "";
  // String? bobotJenisWisata = "";
  String? idWilayah = "";
  // String? bobotWilayah = "";
  String? idRating = "";
  // String? bobotRating = "";
  String? idHargaTiket = "";
  // String? bobotHargaTiket = "";
  String? idHariOperasional = "";
  // String? bobotHariOperasional = "";
  String? idJamOperasional = "";
  // String? bobotJamOperasional = "";

  String? jenisWisata = "";
  String? wilayah = "";
  String? rating = "";
  String? hargaTiket = "";
  String? hariOperasional = "";
  String? jamOperasional = "";

  FilterPencarian({
    this.berdasarkan = "",
    this.isi = "",
    this.limit = "",
    this.hal = "",
    this.dari = "",
    this.sampai = "",
    this.auth = "",
    this.idPeserta = "",
    this.idJenisWisata,
    this.idWilayah,
    this.idRating,
    this.idHargaTiket,
    this.idHariOperasional,
    this.idJamOperasional,
  });

  // copy with
  FilterPencarian copyWith({
    String? berdasarkan,
    String? isi,
    String? limit,
    String? hal,
    String? dari,
    String? sampai,
    String? auth,
    String? idPeserta,
    String? idJenisWisata,
    String? idWilayah,
    String? idRating,
    String? idHargaTiket,
    String? idHariOperasional,
    String? idJamOperasional,
  }) {
    final data = FilterPencarian(
      berdasarkan: berdasarkan ?? this.berdasarkan,
      isi: isi ?? this.isi,
      limit: limit ?? this.limit,
      hal: hal ?? this.hal,
      dari: dari ?? this.dari,
      sampai: sampai ?? this.sampai,
      auth: auth ?? this.auth,
      idPeserta: idPeserta ?? this.idPeserta,
      idJenisWisata: idJenisWisata ?? this.idJenisWisata,
      idWilayah: idWilayah ?? this.idWilayah,
      idRating: idRating ?? this.idRating,
      idHargaTiket: idHargaTiket ?? this.idHargaTiket,
      idHariOperasional: idHariOperasional ?? this.idHariOperasional,
      idJamOperasional: idJamOperasional ?? this.idJamOperasional,
    );
    return data;
  }

  // toString
  @override
  String toString() {
    return 'FilterPencarian(berdasarkan: $berdasarkan, isi: $isi, limit: $limit, hal: $hal, dari: $dari, sampai: $sampai, auth: $auth, idPeserta: $idPeserta, idJenisWisata: $idJenisWisata, idWilayah: $idWilayah, idRating: $idRating, idHargaTiket: $idHargaTiket, idHariOperasional: $idHariOperasional, idJamOperasional: $idJamOperasional)';
  }
}
