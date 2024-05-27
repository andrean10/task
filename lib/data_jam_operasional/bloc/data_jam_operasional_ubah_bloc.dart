import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_api.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional.dart';
import 'package:recomend_toba/data_jam_operasional/repo/data_jam_operasional_remote.dart';
// import 'package:recomend_toba/data_jam_operasional/repo/DataJamOperasionalUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJamOperasionalUbahBloc
    extends Bloc<DataJamOperasionalUbahEvent, DataJamOperasionalUbahState> {
  DataJamOperasionalRemote remoteRepo = DataJamOperasionalRemote();
  // DataJamOperasionalUbahLocal localRepo = DataJamOperasionalUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJamOperasionalUbahBloc() : super(DataJamOperasionalUbahInitial()) {
    on<FetchDataJamOperasionalUbah>(((event, emit) async {
      emit(DataJamOperasionalUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataJamOperasionalUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataJamOperasionalUbahLoadSuccess(
            data: DataJamOperasionalApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataJamOperasionalUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJamOperasionalUbahEvent extends Equatable {
  const DataJamOperasionalUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJamOperasionalUbah extends DataJamOperasionalUbahEvent {
  final DataJamOperasional filter;

  const FetchDataJamOperasionalUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataJamOperasionalUbahState extends Equatable {
  const DataJamOperasionalUbahState();

  @override
  List<Object> get props => [];
}

class DataJamOperasionalUbahInitial extends DataJamOperasionalUbahState {}

class DataJamOperasionalUbahLoading extends DataJamOperasionalUbahState {}

class DataJamOperasionalUbahLoadSuccess extends DataJamOperasionalUbahState {
  final DataJamOperasionalApi data;
  const DataJamOperasionalUbahLoadSuccess({required this.data});
}

class DataJamOperasionalUbahNoInternet extends DataJamOperasionalUbahState {}

class DataJamOperasionalUbahLoadFailure extends DataJamOperasionalUbahState {
  final String pesan;
  const DataJamOperasionalUbahLoadFailure({required this.pesan});
}
