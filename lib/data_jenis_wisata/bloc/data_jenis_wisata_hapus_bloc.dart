import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_api.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_result_api.dart';
import 'package:recomend_toba/data_jenis_wisata/repo/data_jenis_wisata_remote.dart';
// import 'package:recomend_toba/data_jenis_wisata/repo/DataJenisWisataHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJenisWisataHapusBloc
    extends Bloc<DataJenisWisataHapusEvent, DataJenisWisataHapusState> {
  DataJenisWisataRemote remoteRepo = DataJenisWisataRemote();
  // DataJenisWisataHapusLocal localRepo = DataJenisWisataHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJenisWisataHapusBloc() : super(DataJenisWisataHapusInitial()) {
    on<FetchDataJenisWisataHapus>(((event, emit) async {
      emit(DataJenisWisataHapusLoading());
      emit(DataJenisWisataHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataJenisWisataHapusNoInternet());
        return;
      }
*/
      try {
        final DataJenisWisataResultApi response =
            await remoteRepo.hapus(event.data);
        emit(DataJenisWisataHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataJenisWisataHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJenisWisataHapusEvent extends Equatable {
  const DataJenisWisataHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJenisWisataHapus extends DataJenisWisataHapusEvent {
  final DataHapus data;

  const FetchDataJenisWisataHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataJenisWisataHapusState extends Equatable {
  const DataJenisWisataHapusState();

  @override
  List<Object> get props => [];
}

class DataJenisWisataHapusInitial extends DataJenisWisataHapusState {}

class DataJenisWisataHapusLoading extends DataJenisWisataHapusState {}

class DataJenisWisataHapusLoadSuccess extends DataJenisWisataHapusState {}

class DataJenisWisataHapusNoInternet extends DataJenisWisataHapusState {}

class DataJenisWisataHapusLoadFailure extends DataJenisWisataHapusState {
  final String pesan;
  const DataJenisWisataHapusLoadFailure({required this.pesan});
}
