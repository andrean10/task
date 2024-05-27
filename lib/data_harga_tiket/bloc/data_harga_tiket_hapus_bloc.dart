import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_api.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_result_api.dart';
import 'package:recomend_toba/data_harga_tiket/repo/data_harga_tiket_remote.dart';
// import 'package:recomend_toba/data_harga_tiket/repo/DataHargaTiketHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHargaTiketHapusBloc
    extends Bloc<DataHargaTiketHapusEvent, DataHargaTiketHapusState> {
  DataHargaTiketRemote remoteRepo = DataHargaTiketRemote();
  // DataHargaTiketHapusLocal localRepo = DataHargaTiketHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHargaTiketHapusBloc() : super(DataHargaTiketHapusInitial()) {
    on<FetchDataHargaTiketHapus>(((event, emit) async {
      emit(DataHargaTiketHapusLoading());
      emit(DataHargaTiketHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataHargaTiketHapusNoInternet());
        return;
      }
*/
      try {
        final DataHargaTiketResultApi response =
            await remoteRepo.hapus(event.data);
        emit(DataHargaTiketHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataHargaTiketHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHargaTiketHapusEvent extends Equatable {
  const DataHargaTiketHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHargaTiketHapus extends DataHargaTiketHapusEvent {
  final DataHapus data;

  const FetchDataHargaTiketHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataHargaTiketHapusState extends Equatable {
  const DataHargaTiketHapusState();

  @override
  List<Object> get props => [];
}

class DataHargaTiketHapusInitial extends DataHargaTiketHapusState {}

class DataHargaTiketHapusLoading extends DataHargaTiketHapusState {}

class DataHargaTiketHapusLoadSuccess extends DataHargaTiketHapusState {}

class DataHargaTiketHapusNoInternet extends DataHargaTiketHapusState {}

class DataHargaTiketHapusLoadFailure extends DataHargaTiketHapusState {
  final String pesan;
  const DataHargaTiketHapusLoadFailure({required this.pesan});
}
