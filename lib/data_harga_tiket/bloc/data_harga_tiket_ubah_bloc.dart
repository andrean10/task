import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_api.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket.dart';
import 'package:recomend_toba/data_harga_tiket/repo/data_harga_tiket_remote.dart';
// import 'package:recomend_toba/data_harga_tiket/repo/DataHargaTiketUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHargaTiketUbahBloc
    extends Bloc<DataHargaTiketUbahEvent, DataHargaTiketUbahState> {
  DataHargaTiketRemote remoteRepo = DataHargaTiketRemote();
  // DataHargaTiketUbahLocal localRepo = DataHargaTiketUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHargaTiketUbahBloc() : super(DataHargaTiketUbahInitial()) {
    on<FetchDataHargaTiketUbah>(((event, emit) async {
      emit(DataHargaTiketUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataHargaTiketUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataHargaTiketUbahLoadSuccess(
            data: DataHargaTiketApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataHargaTiketUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHargaTiketUbahEvent extends Equatable {
  const DataHargaTiketUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHargaTiketUbah extends DataHargaTiketUbahEvent {
  final DataHargaTiket filter;

  const FetchDataHargaTiketUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataHargaTiketUbahState extends Equatable {
  const DataHargaTiketUbahState();

  @override
  List<Object> get props => [];
}

class DataHargaTiketUbahInitial extends DataHargaTiketUbahState {}

class DataHargaTiketUbahLoading extends DataHargaTiketUbahState {}

class DataHargaTiketUbahLoadSuccess extends DataHargaTiketUbahState {
  final DataHargaTiketApi data;
  const DataHargaTiketUbahLoadSuccess({required this.data});
}

class DataHargaTiketUbahNoInternet extends DataHargaTiketUbahState {}

class DataHargaTiketUbahLoadFailure extends DataHargaTiketUbahState {
  final String pesan;
  const DataHargaTiketUbahLoadFailure({required this.pesan});
}
