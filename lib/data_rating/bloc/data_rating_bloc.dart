import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_rating/data/data_rating_api.dart';
import 'package:recomend_toba/data_rating/repo/data_rating_remote.dart';
// import 'package:recomend_toba/data_rating/repo/DataRating_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataRatingBloc extends Bloc<DataRatingEvent, DataRatingState> {
  DataRatingRemote remoteRepo = DataRatingRemote();
  // DataRatingLocal localRepo = DataRatingLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataRatingBloc() : super(DataRatingInitial()) {
    on<FetchDataRating>(((event, emit) async {
      emit(DataRatingLoading());
      if (!await networkInfo.isConnected) {
        emit(DataRatingNoInternet());
        return;
      }
      try {
        final DataRatingApi response = await remoteRepo.getData(event.filter);
        emit(DataRatingLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataRatingLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataRatingEvent extends Equatable {
  const DataRatingEvent();

  @override
  List<Object> get props => [];
}

class FetchDataRating extends DataRatingEvent {
  final DataFilter filter;

  const FetchDataRating(this.filter);
}

/*
BLOC STATE
*/
abstract class DataRatingState extends Equatable {
  const DataRatingState();

  @override
  List<Object> get props => [];
}

class DataRatingInitial extends DataRatingState {}

class DataRatingLoading extends DataRatingState {}

class DataRatingLoadSuccess extends DataRatingState {
  final DataRatingApi data;
  const DataRatingLoadSuccess({required this.data});
}

class DataRatingNoInternet extends DataRatingState {}

class DataRatingLoadFailure extends DataRatingState {
  final String pesan;
  const DataRatingLoadFailure({required this.pesan});
}
