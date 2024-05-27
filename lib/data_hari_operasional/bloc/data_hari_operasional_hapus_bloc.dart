import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_api.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_result_api.dart';
import 'package:recomend_toba/data_hari_operasional/repo/data_hari_operasional_remote.dart';
// import 'package:recomend_toba/data_hari_operasional/repo/DataHariOperasionalHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHariOperasionalHapusBloc
    extends Bloc<DataHariOperasionalHapusEvent, DataHariOperasionalHapusState> {
  DataHariOperasionalRemote remoteRepo = DataHariOperasionalRemote();
  // DataHariOperasionalHapusLocal localRepo = DataHariOperasionalHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHariOperasionalHapusBloc() : super(DataHariOperasionalHapusInitial()) {
    on<FetchDataHariOperasionalHapus>(((event, emit) async {
      emit(DataHariOperasionalHapusLoading());
      emit(DataHariOperasionalHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataHariOperasionalHapusNoInternet());
        return;
      }
*/
      try {
        final DataHariOperasionalResultApi response =
            await remoteRepo.hapus(event.data);
        emit(DataHariOperasionalHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataHariOperasionalHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHariOperasionalHapusEvent extends Equatable {
  const DataHariOperasionalHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHariOperasionalHapus extends DataHariOperasionalHapusEvent {
  final DataHapus data;

  const FetchDataHariOperasionalHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataHariOperasionalHapusState extends Equatable {
  const DataHariOperasionalHapusState();

  @override
  List<Object> get props => [];
}

class DataHariOperasionalHapusInitial extends DataHariOperasionalHapusState {}

class DataHariOperasionalHapusLoading extends DataHariOperasionalHapusState {}

class DataHariOperasionalHapusLoadSuccess
    extends DataHariOperasionalHapusState {}

class DataHariOperasionalHapusNoInternet extends DataHariOperasionalHapusState {
}

class DataHariOperasionalHapusLoadFailure
    extends DataHariOperasionalHapusState {
  final String pesan;
  const DataHariOperasionalHapusLoadFailure({required this.pesan});
}
