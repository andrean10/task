import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_api.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_result_api.dart';
import 'package:recomend_toba/data_bobot/repo/data_bobot_remote.dart';
// import 'package:recomend_toba/data_bobot/repo/DataBobotHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataBobotHapusBloc
    extends Bloc<DataBobotHapusEvent, DataBobotHapusState> {
  DataBobotRemote remoteRepo = DataBobotRemote();
  // DataBobotHapusLocal localRepo = DataBobotHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataBobotHapusBloc() : super(DataBobotHapusInitial()) {
    on<FetchDataBobotHapus>(((event, emit) async {
      emit(DataBobotHapusLoading());
      emit(DataBobotHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataBobotHapusNoInternet());
        return;
      }
*/
      try {
        final DataBobotResultApi response = await remoteRepo.hapus(event.data);
        emit(DataBobotHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataBobotHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataBobotHapusEvent extends Equatable {
  const DataBobotHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataBobotHapus extends DataBobotHapusEvent {
  final DataHapus data;

  const FetchDataBobotHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataBobotHapusState extends Equatable {
  const DataBobotHapusState();

  @override
  List<Object> get props => [];
}

class DataBobotHapusInitial extends DataBobotHapusState {}

class DataBobotHapusLoading extends DataBobotHapusState {}

class DataBobotHapusLoadSuccess extends DataBobotHapusState {}

class DataBobotHapusNoInternet extends DataBobotHapusState {}

class DataBobotHapusLoadFailure extends DataBobotHapusState {
  final String pesan;
  const DataBobotHapusLoadFailure({required this.pesan});
}
