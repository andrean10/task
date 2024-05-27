import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_api.dart';
import 'package:recomend_toba/data_jenis_wisata/repo/data_jenis_wisata_remote.dart';
// import 'package:recomend_toba/data_jenis_wisata/repo/DataJenisWisata_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJenisWisataBloc
    extends Bloc<DataJenisWisataEvent, DataJenisWisataState> {
  DataJenisWisataRemote remoteRepo = DataJenisWisataRemote();
  // DataJenisWisataLocal localRepo = DataJenisWisataLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJenisWisataBloc() : super(DataJenisWisataInitial()) {
    on<FetchDataJenisWisata>(((event, emit) async {
      emit(DataJenisWisataLoading());
      if (!await networkInfo.isConnected) {
        emit(DataJenisWisataNoInternet());
        return;
      }
      try {
        final DataJenisWisataApi response =
            await remoteRepo.getData(event.filter);
        emit(DataJenisWisataLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataJenisWisataLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJenisWisataEvent extends Equatable {
  const DataJenisWisataEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJenisWisata extends DataJenisWisataEvent {
  final DataFilter filter;

  const FetchDataJenisWisata(this.filter);
}

/*
BLOC STATE
*/
abstract class DataJenisWisataState extends Equatable {
  const DataJenisWisataState();

  @override
  List<Object> get props => [];
}

class DataJenisWisataInitial extends DataJenisWisataState {}

class DataJenisWisataLoading extends DataJenisWisataState {}

class DataJenisWisataLoadSuccess extends DataJenisWisataState {
  final DataJenisWisataApi data;
  const DataJenisWisataLoadSuccess({required this.data});
}

class DataJenisWisataNoInternet extends DataJenisWisataState {}

class DataJenisWisataLoadFailure extends DataJenisWisataState {
  final String pesan;
  const DataJenisWisataLoadFailure({required this.pesan});
}
