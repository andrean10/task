import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_rating/data/data_rating_api.dart';
import 'package:recomend_toba/data_rating/data/data_rating_result_api.dart';
import 'package:recomend_toba/data_rating/repo/data_rating_remote.dart';
// import 'package:recomend_toba/data_rating/repo/DataRatingHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataRatingHapusBloc
    extends Bloc<DataRatingHapusEvent, DataRatingHapusState> {
  DataRatingRemote remoteRepo = DataRatingRemote();
  // DataRatingHapusLocal localRepo = DataRatingHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataRatingHapusBloc() : super(DataRatingHapusInitial()) {
    on<FetchDataRatingHapus>(((event, emit) async {
      emit(DataRatingHapusLoading());
      emit(DataRatingHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataRatingHapusNoInternet());
        return;
      }
*/
      try {
        final DataRatingResultApi response = await remoteRepo.hapus(event.data);
        emit(DataRatingHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataRatingHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataRatingHapusEvent extends Equatable {
  const DataRatingHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataRatingHapus extends DataRatingHapusEvent {
  final DataHapus data;

  const FetchDataRatingHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataRatingHapusState extends Equatable {
  const DataRatingHapusState();

  @override
  List<Object> get props => [];
}

class DataRatingHapusInitial extends DataRatingHapusState {}

class DataRatingHapusLoading extends DataRatingHapusState {}

class DataRatingHapusLoadSuccess extends DataRatingHapusState {}

class DataRatingHapusNoInternet extends DataRatingHapusState {}

class DataRatingHapusLoadFailure extends DataRatingHapusState {
  final String pesan;
  const DataRatingHapusLoadFailure({required this.pesan});
}
