import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_api.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot.dart';
import 'package:recomend_toba/data_bobot/repo/data_bobot_remote.dart';
// import 'package:recomend_toba/data_bobot/repo/DataBobotUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataBobotUbahBloc extends Bloc<DataBobotUbahEvent, DataBobotUbahState> {
  DataBobotRemote remoteRepo = DataBobotRemote();
  // DataBobotUbahLocal localRepo = DataBobotUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataBobotUbahBloc() : super(DataBobotUbahInitial()) {
    on<FetchDataBobotUbah>(((event, emit) async {
      emit(DataBobotUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataBobotUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataBobotUbahLoadSuccess(
            data: DataBobotApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataBobotUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataBobotUbahEvent extends Equatable {
  const DataBobotUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataBobotUbah extends DataBobotUbahEvent {
  final DataBobot filter;

  const FetchDataBobotUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataBobotUbahState extends Equatable {
  const DataBobotUbahState();

  @override
  List<Object> get props => [];
}

class DataBobotUbahInitial extends DataBobotUbahState {}

class DataBobotUbahLoading extends DataBobotUbahState {}

class DataBobotUbahLoadSuccess extends DataBobotUbahState {
  final DataBobotApi data;
  const DataBobotUbahLoadSuccess({required this.data});
}

class DataBobotUbahNoInternet extends DataBobotUbahState {}

class DataBobotUbahLoadFailure extends DataBobotUbahState {
  final String pesan;
  const DataBobotUbahLoadFailure({required this.pesan});
}
