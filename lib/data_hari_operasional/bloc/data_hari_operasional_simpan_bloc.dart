import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_api.dart';
import 'package:recomend_toba/data_hari_operasional/repo/data_hari_operasional_remote.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional.dart';
// import 'package:recomend_toba/data_hari_operasional/repo/DataHariOperasionalSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHariOperasionalSimpanBloc extends Bloc<DataHariOperasionalSimpanEvent,
    DataHariOperasionalSimpanState> {
  DataHariOperasionalRemote remoteRepo = DataHariOperasionalRemote();
  // DataHariOperasionalSimpanLocal localRepo = DataHariOperasionalSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHariOperasionalSimpanBloc() : super(DataHariOperasionalSimpanInitial()) {
    on<FetchDataHariOperasionalSimpan>(((event, emit) async {
      emit(DataHariOperasionalSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataHariOperasionalSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataHariOperasionalSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataHariOperasionalSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHariOperasionalSimpanEvent extends Equatable {
  const DataHariOperasionalSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHariOperasionalSimpan extends DataHariOperasionalSimpanEvent {
  final DataHariOperasional data;

  const FetchDataHariOperasionalSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataHariOperasionalSimpanState extends Equatable {
  const DataHariOperasionalSimpanState();

  @override
  List<Object> get props => [];
}

class DataHariOperasionalSimpanInitial extends DataHariOperasionalSimpanState {}

class DataHariOperasionalSimpanLoading extends DataHariOperasionalSimpanState {}

class DataHariOperasionalSimpanLoadSuccess
    extends DataHariOperasionalSimpanState {}

class DataHariOperasionalSimpanNoInternet
    extends DataHariOperasionalSimpanState {}

class DataHariOperasionalSimpanLoadFailure
    extends DataHariOperasionalSimpanState {
  final String pesan;
  const DataHariOperasionalSimpanLoadFailure({required this.pesan});
}
