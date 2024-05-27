import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_api.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata.dart';
import 'package:recomend_toba/data_jenis_wisata/repo/data_jenis_wisata_remote.dart';
// import 'package:recomend_toba/data_jenis_wisata/repo/DataJenisWisataUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJenisWisataUbahBloc
    extends Bloc<DataJenisWisataUbahEvent, DataJenisWisataUbahState> {
  DataJenisWisataRemote remoteRepo = DataJenisWisataRemote();
  // DataJenisWisataUbahLocal localRepo = DataJenisWisataUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJenisWisataUbahBloc() : super(DataJenisWisataUbahInitial()) {
    on<FetchDataJenisWisataUbah>(((event, emit) async {
      emit(DataJenisWisataUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataJenisWisataUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataJenisWisataUbahLoadSuccess(
            data: DataJenisWisataApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataJenisWisataUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJenisWisataUbahEvent extends Equatable {
  const DataJenisWisataUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJenisWisataUbah extends DataJenisWisataUbahEvent {
  final DataJenisWisata filter;

  const FetchDataJenisWisataUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataJenisWisataUbahState extends Equatable {
  const DataJenisWisataUbahState();

  @override
  List<Object> get props => [];
}

class DataJenisWisataUbahInitial extends DataJenisWisataUbahState {}

class DataJenisWisataUbahLoading extends DataJenisWisataUbahState {}

class DataJenisWisataUbahLoadSuccess extends DataJenisWisataUbahState {
  final DataJenisWisataApi data;
  const DataJenisWisataUbahLoadSuccess({required this.data});
}

class DataJenisWisataUbahNoInternet extends DataJenisWisataUbahState {}

class DataJenisWisataUbahLoadFailure extends DataJenisWisataUbahState {
  final String pesan;
  const DataJenisWisataUbahLoadFailure({required this.pesan});
}
