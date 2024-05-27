import 'package:image_picker/image_picker.dart';

class DataWisata {
  String? idWisata = "";
  String? namaWisata = "";
  String? foto = "";
  String? deskripsi = "";
  String? koordinat = "";
  String? idJenisWisata = "";
  String? idWilayah = "";
  String? idRating = "";
  String? idHargaTiket = "";
  String? idHariOperasional = "";
  String? idJamOperasional = "";

  XFile? fileFoto;

  String? jenisWisata = "";
  String? wilayah = "";
  String? rating = "";
  String? hargaTiket = "";
  String? hariOperasional = "";
  String? jamOperasional = "";

  // untuk ignore
  // @JsonKey(ignore: true)
  // bool isSelected = false;

  DataWisata({
    this.idWisata,
    this.namaWisata,
    this.foto,
    this.deskripsi,
    this.koordinat,
    this.idJenisWisata,
    this.idWilayah,
    this.idRating,
    this.idHargaTiket,
    this.idHariOperasional,
    this.idJamOperasional,
    this.jenisWisata,
    this.wilayah,
    this.rating,
    this.hargaTiket,
    this.hariOperasional,
    this.jamOperasional,
  });
}
