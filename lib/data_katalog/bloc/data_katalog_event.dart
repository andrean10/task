import 'package:equatable/equatable.dart';
import 'package:recomend_toba/data/data_filter.dart';

abstract class DataKatalogEvent extends Equatable {
  const DataKatalogEvent();

  @override
  List<Object> get props => [];
}

class FetchDataKatalog extends DataKatalogEvent {
  final DataFilter filter;

  const FetchDataKatalog(this.filter);
}
