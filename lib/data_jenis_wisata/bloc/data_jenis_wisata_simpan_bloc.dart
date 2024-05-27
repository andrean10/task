import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_api.dart';
import 'package:recomend_toba/data_jenis_wisata/repo/data_jenis_wisata_remote.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata.dart';
// import 'package:recomend_toba/data_jenis_wisata/repo/DataJenisWisataSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJenisWisataSimpanBloc
    extends Bloc<DataJenisWisataSimpanEvent, DataJenisWisataSimpanState> {
  DataJenisWisataRemote remoteRepo = DataJenisWisataRemote();
  // DataJenisWisataSimpanLocal localRepo = DataJenisWisataSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJenisWisataSimpanBloc() : super(DataJenisWisataSimpanInitial()) {
    on<FetchDataJenisWisataSimpan>(((event, emit) async {
      emit(DataJenisWisataSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataJenisWisataSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataJenisWisataSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataJenisWisataSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJenisWisataSimpanEvent extends Equatable {
  const DataJenisWisataSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJenisWisataSimpan extends DataJenisWisataSimpanEvent {
  final DataJenisWisata data;

  const FetchDataJenisWisataSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataJenisWisataSimpanState extends Equatable {
  const DataJenisWisataSimpanState();

  @override
  List<Object> get props => [];
}

class DataJenisWisataSimpanInitial extends DataJenisWisataSimpanState {}

class DataJenisWisataSimpanLoading extends DataJenisWisataSimpanState {}

class DataJenisWisataSimpanLoadSuccess extends DataJenisWisataSimpanState {}

class DataJenisWisataSimpanNoInternet extends DataJenisWisataSimpanState {}

class DataJenisWisataSimpanLoadFailure extends DataJenisWisataSimpanState {
  final String pesan;
  const DataJenisWisataSimpanLoadFailure({required this.pesan});
}
