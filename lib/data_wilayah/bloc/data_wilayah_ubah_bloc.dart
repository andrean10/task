import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_api.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah.dart';
import 'package:recomend_toba/data_wilayah/repo/data_wilayah_remote.dart';
// import 'package:recomend_toba/data_wilayah/repo/DataWilayahUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWilayahUbahBloc
    extends Bloc<DataWilayahUbahEvent, DataWilayahUbahState> {
  DataWilayahRemote remoteRepo = DataWilayahRemote();
  // DataWilayahUbahLocal localRepo = DataWilayahUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataWilayahUbahBloc() : super(DataWilayahUbahInitial()) {
    on<FetchDataWilayahUbah>(((event, emit) async {
      emit(DataWilayahUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataWilayahUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataWilayahUbahLoadSuccess(
            data: DataWilayahApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataWilayahUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataWilayahUbahEvent extends Equatable {
  const DataWilayahUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataWilayahUbah extends DataWilayahUbahEvent {
  final DataWilayah filter;

  const FetchDataWilayahUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataWilayahUbahState extends Equatable {
  const DataWilayahUbahState();

  @override
  List<Object> get props => [];
}

class DataWilayahUbahInitial extends DataWilayahUbahState {}

class DataWilayahUbahLoading extends DataWilayahUbahState {}

class DataWilayahUbahLoadSuccess extends DataWilayahUbahState {
  final DataWilayahApi data;
  const DataWilayahUbahLoadSuccess({required this.data});
}

class DataWilayahUbahNoInternet extends DataWilayahUbahState {}

class DataWilayahUbahLoadFailure extends DataWilayahUbahState {
  final String pesan;
  const DataWilayahUbahLoadFailure({required this.pesan});
}
