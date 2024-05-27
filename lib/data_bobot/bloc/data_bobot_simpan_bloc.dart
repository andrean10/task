import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_api.dart';
import 'package:recomend_toba/data_bobot/repo/data_bobot_remote.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot.dart';
// import 'package:recomend_toba/data_bobot/repo/DataBobotSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataBobotSimpanBloc
    extends Bloc<DataBobotSimpanEvent, DataBobotSimpanState> {
  DataBobotRemote remoteRepo = DataBobotRemote();
  // DataBobotSimpanLocal localRepo = DataBobotSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataBobotSimpanBloc() : super(DataBobotSimpanInitial()) {
    on<FetchDataBobotSimpan>(((event, emit) async {
      emit(DataBobotSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataBobotSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataBobotSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataBobotSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataBobotSimpanEvent extends Equatable {
  const DataBobotSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataBobotSimpan extends DataBobotSimpanEvent {
  final DataBobot data;

  const FetchDataBobotSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataBobotSimpanState extends Equatable {
  const DataBobotSimpanState();

  @override
  List<Object> get props => [];
}

class DataBobotSimpanInitial extends DataBobotSimpanState {}

class DataBobotSimpanLoading extends DataBobotSimpanState {}

class DataBobotSimpanLoadSuccess extends DataBobotSimpanState {}

class DataBobotSimpanNoInternet extends DataBobotSimpanState {}

class DataBobotSimpanLoadFailure extends DataBobotSimpanState {
  final String pesan;
  const DataBobotSimpanLoadFailure({required this.pesan});
}
