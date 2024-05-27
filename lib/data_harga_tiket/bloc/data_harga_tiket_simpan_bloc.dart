import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_api.dart';
import 'package:recomend_toba/data_harga_tiket/repo/data_harga_tiket_remote.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket.dart';
// import 'package:recomend_toba/data_harga_tiket/repo/DataHargaTiketSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHargaTiketSimpanBloc
    extends Bloc<DataHargaTiketSimpanEvent, DataHargaTiketSimpanState> {
  DataHargaTiketRemote remoteRepo = DataHargaTiketRemote();
  // DataHargaTiketSimpanLocal localRepo = DataHargaTiketSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHargaTiketSimpanBloc() : super(DataHargaTiketSimpanInitial()) {
    on<FetchDataHargaTiketSimpan>(((event, emit) async {
      emit(DataHargaTiketSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataHargaTiketSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataHargaTiketSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataHargaTiketSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHargaTiketSimpanEvent extends Equatable {
  const DataHargaTiketSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHargaTiketSimpan extends DataHargaTiketSimpanEvent {
  final DataHargaTiket data;

  const FetchDataHargaTiketSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataHargaTiketSimpanState extends Equatable {
  const DataHargaTiketSimpanState();

  @override
  List<Object> get props => [];
}

class DataHargaTiketSimpanInitial extends DataHargaTiketSimpanState {}

class DataHargaTiketSimpanLoading extends DataHargaTiketSimpanState {}

class DataHargaTiketSimpanLoadSuccess extends DataHargaTiketSimpanState {}

class DataHargaTiketSimpanNoInternet extends DataHargaTiketSimpanState {}

class DataHargaTiketSimpanLoadFailure extends DataHargaTiketSimpanState {
  final String pesan;
  const DataHargaTiketSimpanLoadFailure({required this.pesan});
}
