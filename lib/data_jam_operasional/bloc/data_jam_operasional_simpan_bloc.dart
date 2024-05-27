import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_api.dart';
import 'package:recomend_toba/data_jam_operasional/repo/data_jam_operasional_remote.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional.dart';
// import 'package:recomend_toba/data_jam_operasional/repo/DataJamOperasionalSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJamOperasionalSimpanBloc
    extends Bloc<DataJamOperasionalSimpanEvent, DataJamOperasionalSimpanState> {
  DataJamOperasionalRemote remoteRepo = DataJamOperasionalRemote();
  // DataJamOperasionalSimpanLocal localRepo = DataJamOperasionalSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJamOperasionalSimpanBloc() : super(DataJamOperasionalSimpanInitial()) {
    on<FetchDataJamOperasionalSimpan>(((event, emit) async {
      emit(DataJamOperasionalSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataJamOperasionalSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataJamOperasionalSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataJamOperasionalSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJamOperasionalSimpanEvent extends Equatable {
  const DataJamOperasionalSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJamOperasionalSimpan extends DataJamOperasionalSimpanEvent {
  final DataJamOperasional data;

  const FetchDataJamOperasionalSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataJamOperasionalSimpanState extends Equatable {
  const DataJamOperasionalSimpanState();

  @override
  List<Object> get props => [];
}

class DataJamOperasionalSimpanInitial extends DataJamOperasionalSimpanState {}

class DataJamOperasionalSimpanLoading extends DataJamOperasionalSimpanState {}

class DataJamOperasionalSimpanLoadSuccess
    extends DataJamOperasionalSimpanState {}

class DataJamOperasionalSimpanNoInternet extends DataJamOperasionalSimpanState {
}

class DataJamOperasionalSimpanLoadFailure
    extends DataJamOperasionalSimpanState {
  final String pesan;
  const DataJamOperasionalSimpanLoadFailure({required this.pesan});
}
