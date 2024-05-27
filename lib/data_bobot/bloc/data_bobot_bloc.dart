import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_api.dart';
import 'package:recomend_toba/data_bobot/repo/data_bobot_remote.dart';
// import 'package:recomend_toba/data_bobot/repo/DataBobot_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataBobotBloc extends Bloc<DataBobotEvent, DataBobotState> {
  DataBobotRemote remoteRepo = DataBobotRemote();
  // DataBobotLocal localRepo = DataBobotLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataBobotBloc() : super(DataBobotInitial()) {
    on<FetchDataBobot>(((event, emit) async {
      emit(DataBobotLoading());
      if (!await networkInfo.isConnected) {
        emit(DataBobotNoInternet());
        return;
      }
      try {
        final DataBobotApi response = await remoteRepo.getData(event.filter);
        emit(DataBobotLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataBobotLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataBobotEvent extends Equatable {
  const DataBobotEvent();

  @override
  List<Object> get props => [];
}

class FetchDataBobot extends DataBobotEvent {
  final DataFilter filter;

  const FetchDataBobot(this.filter);
}

/*
BLOC STATE
*/
abstract class DataBobotState extends Equatable {
  const DataBobotState();

  @override
  List<Object> get props => [];
}

class DataBobotInitial extends DataBobotState {}

class DataBobotLoading extends DataBobotState {}

class DataBobotLoadSuccess extends DataBobotState {
  final DataBobotApi data;
  const DataBobotLoadSuccess({required this.data});
}

class DataBobotNoInternet extends DataBobotState {}

class DataBobotLoadFailure extends DataBobotState {
  final String pesan;
  const DataBobotLoadFailure({required this.pesan});
}
