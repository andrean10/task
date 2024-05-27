import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_api.dart';
import 'package:recomend_toba/data_harga_tiket/repo/data_harga_tiket_remote.dart';
// import 'package:recomend_toba/data_harga_tiket/repo/DataHargaTiket_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHargaTiketBloc
    extends Bloc<DataHargaTiketEvent, DataHargaTiketState> {
  DataHargaTiketRemote remoteRepo = DataHargaTiketRemote();
  // DataHargaTiketLocal localRepo = DataHargaTiketLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHargaTiketBloc() : super(DataHargaTiketInitial()) {
    on<FetchDataHargaTiket>(((event, emit) async {
      emit(DataHargaTiketLoading());
      if (!await networkInfo.isConnected) {
        emit(DataHargaTiketNoInternet());
        return;
      }
      try {
        final DataHargaTiketApi response =
            await remoteRepo.getData(event.filter);
        emit(DataHargaTiketLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataHargaTiketLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHargaTiketEvent extends Equatable {
  const DataHargaTiketEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHargaTiket extends DataHargaTiketEvent {
  final DataFilter filter;

  const FetchDataHargaTiket(this.filter);
}

/*
BLOC STATE
*/
abstract class DataHargaTiketState extends Equatable {
  const DataHargaTiketState();

  @override
  List<Object> get props => [];
}

class DataHargaTiketInitial extends DataHargaTiketState {}

class DataHargaTiketLoading extends DataHargaTiketState {}

class DataHargaTiketLoadSuccess extends DataHargaTiketState {
  final DataHargaTiketApi data;
  const DataHargaTiketLoadSuccess({required this.data});
}

class DataHargaTiketNoInternet extends DataHargaTiketState {}

class DataHargaTiketLoadFailure extends DataHargaTiketState {
  final String pesan;
  const DataHargaTiketLoadFailure({required this.pesan});
}
