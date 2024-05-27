import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_api.dart';
import 'package:recomend_toba/data_wilayah/repo/data_wilayah_remote.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah.dart';
// import 'package:recomend_toba/data_wilayah/repo/DataWilayahSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWilayahSimpanBloc
    extends Bloc<DataWilayahSimpanEvent, DataWilayahSimpanState> {
  DataWilayahRemote remoteRepo = DataWilayahRemote();
  // DataWilayahSimpanLocal localRepo = DataWilayahSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataWilayahSimpanBloc() : super(DataWilayahSimpanInitial()) {
    on<FetchDataWilayahSimpan>(((event, emit) async {
      emit(DataWilayahSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataWilayahSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataWilayahSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataWilayahSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataWilayahSimpanEvent extends Equatable {
  const DataWilayahSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataWilayahSimpan extends DataWilayahSimpanEvent {
  final DataWilayah data;

  const FetchDataWilayahSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataWilayahSimpanState extends Equatable {
  const DataWilayahSimpanState();

  @override
  List<Object> get props => [];
}

class DataWilayahSimpanInitial extends DataWilayahSimpanState {}

class DataWilayahSimpanLoading extends DataWilayahSimpanState {}

class DataWilayahSimpanLoadSuccess extends DataWilayahSimpanState {}

class DataWilayahSimpanNoInternet extends DataWilayahSimpanState {}

class DataWilayahSimpanLoadFailure extends DataWilayahSimpanState {
  final String pesan;
  const DataWilayahSimpanLoadFailure({required this.pesan});
}
