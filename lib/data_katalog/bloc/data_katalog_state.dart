import 'package:equatable/equatable.dart';
import 'package:recomend_toba/data_katalog/data/data_katalog_api.dart';

abstract class DataKatalogState extends Equatable {
  const DataKatalogState();

  @override
  List<Object> get props => [];
}

class DataKatalogInitial extends DataKatalogState {}

class DataKatalogLoading extends DataKatalogState {}

class DataKatalogLoadSuccess extends DataKatalogState {
  final DataKatalogApi data;
  const DataKatalogLoadSuccess({required this.data});
}

class DataKatalogNoInternet extends DataKatalogState {}

class DataKatalogLoadFailure extends DataKatalogState {
  final String pesan;
  const DataKatalogLoadFailure({required this.pesan});
}
