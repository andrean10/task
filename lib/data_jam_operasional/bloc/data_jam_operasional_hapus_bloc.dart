import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_api.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_result_api.dart';
import 'package:recomend_toba/data_jam_operasional/repo/data_jam_operasional_remote.dart';
// import 'package:recomend_toba/data_jam_operasional/repo/DataJamOperasionalHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJamOperasionalHapusBloc
    extends Bloc<DataJamOperasionalHapusEvent, DataJamOperasionalHapusState> {
  DataJamOperasionalRemote remoteRepo = DataJamOperasionalRemote();
  // DataJamOperasionalHapusLocal localRepo = DataJamOperasionalHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJamOperasionalHapusBloc() : super(DataJamOperasionalHapusInitial()) {
    on<FetchDataJamOperasionalHapus>(((event, emit) async {
      emit(DataJamOperasionalHapusLoading());
      emit(DataJamOperasionalHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataJamOperasionalHapusNoInternet());
        return;
      }
*/
      try {
        final DataJamOperasionalResultApi response =
            await remoteRepo.hapus(event.data);
        emit(DataJamOperasionalHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataJamOperasionalHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJamOperasionalHapusEvent extends Equatable {
  const DataJamOperasionalHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJamOperasionalHapus extends DataJamOperasionalHapusEvent {
  final DataHapus data;

  const FetchDataJamOperasionalHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataJamOperasionalHapusState extends Equatable {
  const DataJamOperasionalHapusState();

  @override
  List<Object> get props => [];
}

class DataJamOperasionalHapusInitial extends DataJamOperasionalHapusState {}

class DataJamOperasionalHapusLoading extends DataJamOperasionalHapusState {}

class DataJamOperasionalHapusLoadSuccess extends DataJamOperasionalHapusState {}

class DataJamOperasionalHapusNoInternet extends DataJamOperasionalHapusState {}

class DataJamOperasionalHapusLoadFailure extends DataJamOperasionalHapusState {
  final String pesan;
  const DataJamOperasionalHapusLoadFailure({required this.pesan});
}
