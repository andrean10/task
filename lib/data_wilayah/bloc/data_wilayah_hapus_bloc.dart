import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_api.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_result_api.dart';
import 'package:recomend_toba/data_wilayah/repo/data_wilayah_remote.dart';
// import 'package:recomend_toba/data_wilayah/repo/DataWilayahHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWilayahHapusBloc
    extends Bloc<DataWilayahHapusEvent, DataWilayahHapusState> {
  DataWilayahRemote remoteRepo = DataWilayahRemote();
  // DataWilayahHapusLocal localRepo = DataWilayahHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataWilayahHapusBloc() : super(DataWilayahHapusInitial()) {
    on<FetchDataWilayahHapus>(((event, emit) async {
      emit(DataWilayahHapusLoading());
      emit(DataWilayahHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataWilayahHapusNoInternet());
        return;
      }
*/
      try {
        final DataWilayahResultApi response =
            await remoteRepo.hapus(event.data);
        emit(DataWilayahHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataWilayahHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataWilayahHapusEvent extends Equatable {
  const DataWilayahHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataWilayahHapus extends DataWilayahHapusEvent {
  final DataHapus data;

  const FetchDataWilayahHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataWilayahHapusState extends Equatable {
  const DataWilayahHapusState();

  @override
  List<Object> get props => [];
}

class DataWilayahHapusInitial extends DataWilayahHapusState {}

class DataWilayahHapusLoading extends DataWilayahHapusState {}

class DataWilayahHapusLoadSuccess extends DataWilayahHapusState {}

class DataWilayahHapusNoInternet extends DataWilayahHapusState {}

class DataWilayahHapusLoadFailure extends DataWilayahHapusState {
  final String pesan;
  const DataWilayahHapusLoadFailure({required this.pesan});
}
