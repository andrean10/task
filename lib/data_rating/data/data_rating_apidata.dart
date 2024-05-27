import 'package:json_annotation/json_annotation.dart';
import 'package:recomend_toba/data/data_hapus.dart';

part 'data_rating_apidata.g.dart';

@JsonSerializable()
class DataRatingApiData implements DataHapus {
  DataRatingApiData({
    this.idRating,
    this.rating,
    this.nilai,
  });

  @JsonKey(name: "id_rating", defaultValue: "")
  final String? idRating;
  @JsonKey(name: "rating", defaultValue: "")
  final String? rating;
  @JsonKey(name: "nilai", defaultValue: "")
  final String? nilai;

  factory DataRatingApiData.fromJson(Map<String, dynamic> json) =>
      _$DataRatingApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataRatingApiDataToJson(this);

  // create copy with
  DataRatingApiData copyWith({
    String? idRating,
    String? rating,
    String? nilai,
  }) {
    return DataRatingApiData(
      idRating: idRating ?? this.idRating,
      rating: rating ?? this.rating,
      nilai: nilai ?? this.nilai,
    );
  }

  @override
  String getIdHapus() {
    return "$idRating";
  }
}
