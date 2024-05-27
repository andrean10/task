import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_hapus.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_api.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_result_api.dart';
import 'package:recomend_toba/data_wisata/repo/data_wisata_remote.dart';
// import 'package:recomend_toba/data_wisata/repo/DataWisataHapus_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWisataHapusBloc
    extends Bloc<DataWisataHapusEvent, DataWisataHapusState> {
  DataWisataRemote remoteRepo = DataWisataRemote();
  // DataWisataHapusLocal localRepo = DataWisataHapusLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataWisataHapusBloc() : super(DataWisataHapusInitial()) {
    on<FetchDataWisataHapus>(((event, emit) async {
      emit(DataWisataHapusLoading());
      emit(DataWisataHapusLoading());
/*
      if (!await networkInfo.isConnected) {
        emit(DataWisataHapusNoInternet());
        return;
      }
*/
      try {
        final DataWisataResultApi response = await remoteRepo.hapus(event.data);
        emit(DataWisataHapusLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataWisataHapusLoadFailure(
            pesan: "Gagal dihapus, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataWisataHapusEvent extends Equatable {
  const DataWisataHapusEvent();

  @override
  List<Object> get props => [];
}

class FetchDataWisataHapus extends DataWisataHapusEvent {
  final DataHapus data;

  const FetchDataWisataHapus({required this.data});
}

/*
BLOC STATE
*/
abstract class DataWisataHapusState extends Equatable {
  const DataWisataHapusState();

  @override
  List<Object> get props => [];
}

class DataWisataHapusInitial extends DataWisataHapusState {}

class DataWisataHapusLoading extends DataWisataHapusState {}

class DataWisataHapusLoadSuccess extends DataWisataHapusState {}

class DataWisataHapusNoInternet extends DataWisataHapusState {}

class DataWisataHapusLoadFailure extends DataWisataHapusState {
  final String pesan;
  const DataWisataHapusLoadFailure({required this.pesan});
}
