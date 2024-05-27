import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_api.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional.dart';
import 'package:recomend_toba/data_hari_operasional/repo/data_hari_operasional_remote.dart';
// import 'package:recomend_toba/data_hari_operasional/repo/DataHariOperasionalUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHariOperasionalUbahBloc
    extends Bloc<DataHariOperasionalUbahEvent, DataHariOperasionalUbahState> {
  DataHariOperasionalRemote remoteRepo = DataHariOperasionalRemote();
  // DataHariOperasionalUbahLocal localRepo = DataHariOperasionalUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHariOperasionalUbahBloc() : super(DataHariOperasionalUbahInitial()) {
    on<FetchDataHariOperasionalUbah>(((event, emit) async {
      emit(DataHariOperasionalUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataHariOperasionalUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataHariOperasionalUbahLoadSuccess(
            data: DataHariOperasionalApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataHariOperasionalUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHariOperasionalUbahEvent extends Equatable {
  const DataHariOperasionalUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHariOperasionalUbah extends DataHariOperasionalUbahEvent {
  final DataHariOperasional filter;

  const FetchDataHariOperasionalUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataHariOperasionalUbahState extends Equatable {
  const DataHariOperasionalUbahState();

  @override
  List<Object> get props => [];
}

class DataHariOperasionalUbahInitial extends DataHariOperasionalUbahState {}

class DataHariOperasionalUbahLoading extends DataHariOperasionalUbahState {}

class DataHariOperasionalUbahLoadSuccess extends DataHariOperasionalUbahState {
  final DataHariOperasionalApi data;
  const DataHariOperasionalUbahLoadSuccess({required this.data});
}

class DataHariOperasionalUbahNoInternet extends DataHariOperasionalUbahState {}

class DataHariOperasionalUbahLoadFailure extends DataHariOperasionalUbahState {
  final String pesan;
  const DataHariOperasionalUbahLoadFailure({required this.pesan});
}
