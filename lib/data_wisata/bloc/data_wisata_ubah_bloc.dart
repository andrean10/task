import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_api.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata.dart';
import 'package:recomend_toba/data_wisata/repo/data_wisata_remote.dart';
// import 'package:recomend_toba/data_wisata/repo/DataWisataUbah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWisataUbahBloc
    extends Bloc<DataWisataUbahEvent, DataWisataUbahState> {
  DataWisataRemote remoteRepo = DataWisataRemote();
  // DataWisataUbahLocal localRepo = DataWisataUbahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataWisataUbahBloc() : super(DataWisataUbahInitial()) {
    on<FetchDataWisataUbah>(((event, emit) async {
      emit(DataWisataUbahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataWisataUbahNoInternet());
        return;
      }
      try {
        await remoteRepo.ubah(event.filter);
        emit(
          DataWisataUbahLoadSuccess(
            data: DataWisataApi("berhasil", []),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataWisataUbahLoadFailure(
            pesan: "Gagal mengubah, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataWisataUbahEvent extends Equatable {
  const DataWisataUbahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataWisataUbah extends DataWisataUbahEvent {
  final DataWisata filter;

  const FetchDataWisataUbah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataWisataUbahState extends Equatable {
  const DataWisataUbahState();

  @override
  List<Object> get props => [];
}

class DataWisataUbahInitial extends DataWisataUbahState {}

class DataWisataUbahLoading extends DataWisataUbahState {}

class DataWisataUbahLoadSuccess extends DataWisataUbahState {
  final DataWisataApi data;
  const DataWisataUbahLoadSuccess({required this.data});
}

class DataWisataUbahNoInternet extends DataWisataUbahState {}

class DataWisataUbahLoadFailure extends DataWisataUbahState {
  final String pesan;
  const DataWisataUbahLoadFailure({required this.pesan});
}
