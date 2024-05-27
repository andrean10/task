import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_rating/data/data_rating_api.dart';
import 'package:recomend_toba/data_rating/data/data_rating.dart';
import 'package:recomend_toba/data_rating/repo/data_rating_remote.dart';
// import 'package:recomend_toba/data_rating/repo/DataRatingUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataRatingUbahBloc
    extends Bloc<DataRatingUbahEvent, DataRatingUbahState> {
  DataRatingRemote remoteRepo = DataRatingRemote();
  // DataRatingUbahLocal localRepo = DataRatingUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataRatingUbahBloc() : super(DataRatingUbahInitial()) {
    on<FetchDataRatingUbah>(((event, emit) async {
      emit(DataRatingUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataRatingUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataRatingUbahLoadSuccess(
            data: DataRatingApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataRatingUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataRatingUbahEvent extends Equatable {
  const DataRatingUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataRatingUbah extends DataRatingUbahEvent {
  final DataRating filter;

  const FetchDataRatingUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataRatingUbahState extends Equatable {
  const DataRatingUbahState();

  @override
  List<Object> get props => [];
}

class DataRatingUbahInitial extends DataRatingUbahState {}

class DataRatingUbahLoading extends DataRatingUbahState {}

class DataRatingUbahLoadSuccess extends DataRatingUbahState {
  final DataRatingApi data;
  const DataRatingUbahLoadSuccess({required this.data});
}

class DataRatingUbahNoInternet extends DataRatingUbahState {}

class DataRatingUbahLoadFailure extends DataRatingUbahState {
  final String pesan;
  const DataRatingUbahLoadFailure({required this.pesan});
}
