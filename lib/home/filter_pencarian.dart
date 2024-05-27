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
  String? bobotJenisWisata = "";
  String? idWilayah = "";
  String? bobotWilayah = "";
  String? idRating = "";
  String? bobotRating = "";
  String? idHargaTiket = "";
  String? bobotHargaTiket = "";
  String? idHariOperasional = "";
  String? bobotHariOperasional = "";
  String? idJamOperasional = "";
  String? bobotJamOperasional = "";

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
    this.bobotJenisWisata,
    this.bobotWilayah,
    this.bobotRating,
    this.bobotHargaTiket,
    this.bobotHariOperasional,
    this.bobotJamOperasional,
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
    String? bobotJenisWisata,
    String? bobotWilayah,
    String? bobotRating,
    String? bobotHargaTiket,
    String? bobotHariOperasional,
    String? bobotJamOperasional,
  }) {
    return FilterPencarian(
      berdasarkan: berdasarkan ?? this.berdasarkan,
      isi: isi ?? this.isi,
      limit: limit ?? this.limit,
      hal: hal ?? this.hal,
      dari: dari ?? this.dari,
      sampai: sampai ?? this.sampai,
      auth: auth ?? this.auth,
      idPeserta: idPeserta ?? this.idPeserta,
      bobotJenisWisata: bobotJenisWisata ?? this.bobotJenisWisata,
      bobotWilayah: bobotWilayah ?? this.bobotWilayah,
      bobotRating: bobotRating ?? this.bobotRating,
      bobotHargaTiket: bobotHargaTiket ?? this.bobotHargaTiket,
      bobotHariOperasional: bobotHariOperasional ?? this.bobotHariOperasional,
      bobotJamOperasional: bobotJamOperasional ?? this.bobotJamOperasional,
    );
  }

  // toString
  @override
  String toString() {
    return "FilterPencarian(berdasarkan: $berdasarkan, isi: $isi, limit: $limit, hal: $hal, dari: $dari, sampai: $sampai, auth: $auth, idPeserta: $idPeserta, bobotJenisWisata: $bobotJenisWisata, bobotWilayah: $bobotWilayah, bobotRating: $bobotRating, bobotHargaTiket: $bobotHargaTiket, bobotHariOperasional: $bobotHariOperasional, bobotJamOperasional: $bobotJamOperasional)";
  }
}
