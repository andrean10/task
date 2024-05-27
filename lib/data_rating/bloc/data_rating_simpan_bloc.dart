import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_rating/data/data_rating_api.dart';
import 'package:recomend_toba/data_rating/repo/data_rating_remote.dart';
import 'package:recomend_toba/data_rating/data/data_rating.dart';
// import 'package:recomend_toba/data_rating/repo/DataRatingSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataRatingSimpanBloc
    extends Bloc<DataRatingSimpanEvent, DataRatingSimpanState> {
  DataRatingRemote remoteRepo = DataRatingRemote();
  // DataRatingSimpanLocal localRepo = DataRatingSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataRatingSimpanBloc() : super(DataRatingSimpanInitial()) {
    on<FetchDataRatingSimpan>(((event, emit) async {
      emit(DataRatingSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataRatingSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataRatingSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataRatingSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataRatingSimpanEvent extends Equatable {
  const DataRatingSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataRatingSimpan extends DataRatingSimpanEvent {
  final DataRating data;

  const FetchDataRatingSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataRatingSimpanState extends Equatable {
  const DataRatingSimpanState();

  @override
  List<Object> get props => [];
}

class DataRatingSimpanInitial extends DataRatingSimpanState {}

class DataRatingSimpanLoading extends DataRatingSimpanState {}

class DataRatingSimpanLoadSuccess extends DataRatingSimpanState {}

class DataRatingSimpanNoInternet extends DataRatingSimpanState {}

class DataRatingSimpanLoadFailure extends DataRatingSimpanState {
  final String pesan;
  const DataRatingSimpanLoadFailure({required this.pesan});
}
