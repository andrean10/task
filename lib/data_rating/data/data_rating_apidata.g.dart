// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_rating_apidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRatingApiData _$DataRatingApiDataFromJson(Map<String, dynamic> json) =>
    DataRatingApiData(
      idRating: json['id_rating'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      nilai: json['nilai'] as String? ?? '',
    );

Map<String, dynamic> _$DataRatingApiDataToJson(DataRatingApiData instance) =>
    <String, dynamic>{
      'id_rating': instance.idRating,
      'rating': instance.rating,
      'nilai': instance.nilai,
    };
