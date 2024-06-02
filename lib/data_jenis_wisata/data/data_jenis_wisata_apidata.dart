import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_jenis_wisata_apidata.g.dart';

@JsonSerializable()
class DataJenisWisataApiData implements DataHapus {
  DataJenisWisataApiData({
    this.idJenisWisata,
    this.jenisWisata,
    this.nilai,
  });

  @JsonKey(name: "id_jenis_wisata", defaultValue: "")
  final String? idJenisWisata;
  @JsonKey(name: "jenis_wisata", defaultValue: "")
  final String? jenisWisata;
  @JsonKey(name: "nilai", defaultValue: "")
  final String? nilai;

  factory DataJenisWisataApiData.fromJson(Map<String, dynamic> json) =>
      _$DataJenisWisataApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataJenisWisataApiDataToJson(this);

  // create copywith
  DataJenisWisataApiData copyWith({
    String? idJenisWisata,
    String? jenisWisata,
    String? nilai,
  }) {
    return DataJenisWisataApiData(
      idJenisWisata: idJenisWisata ?? this.idJenisWisata,
      jenisWisata: jenisWisata ?? this.jenisWisata,
      nilai: nilai ?? this.nilai,
    );
  }

  @override
  String getIdHapus() {
    return "$idJenisWisata";
  }

  // to string
  @override
  String toString() {
    return 'DataJenisWisataApiData(idJenisWisata: $idJenisWisata, jenisWisata: $jenisWisata, nilai: $nilai)';
  }
}
