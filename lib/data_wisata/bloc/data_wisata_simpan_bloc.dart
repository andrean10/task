import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_api.dart';
import 'package:recomend_toba/data_wisata/repo/data_wisata_remote.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata.dart';
// import 'package:recomend_toba/data_wisata/repo/DataWisataSimpan_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWisataSimpanBloc
    extends Bloc<DataWisataSimpanEvent, DataWisataSimpanState> {
  DataWisataRemote remoteRepo = DataWisataRemote();
  // DataWisataSimpanLocal localRepo = DataWisataSimpanLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataWisataSimpanBloc() : super(DataWisataSimpanInitial()) {
    on<FetchDataWisataSimpan>(((event, emit) async {
      emit(DataWisataSimpanLoading());
      /* if (!await networkInfo.isConnected) {
        emit(DataWisataSimpanNoInternet());
        return;
      } */
      try {
        await remoteRepo.simpan(event.data);
        emit(DataWisataSimpanLoadSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataWisataSimpanLoadFailure(
              pesan: "Gagal menyimpan, Pastikan hp terhubung ke internet"),
        );
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataWisataSimpanEvent extends Equatable {
  const DataWisataSimpanEvent();

  @override
  List<Object> get props => [];
}

class FetchDataWisataSimpan extends DataWisataSimpanEvent {
  final DataWisata data;

  const FetchDataWisataSimpan(this.data);
}

/*
BLOC STATE
*/
abstract class DataWisataSimpanState extends Equatable {
  const DataWisataSimpanState();

  @override
  List<Object> get props => [];
}

class DataWisataSimpanInitial extends DataWisataSimpanState {}

class DataWisataSimpanLoading extends DataWisataSimpanState {}

class DataWisataSimpanLoadSuccess extends DataWisataSimpanState {}

class DataWisataSimpanNoInternet extends DataWisataSimpanState {}

class DataWisataSimpanLoadFailure extends DataWisataSimpanState {
  final String pesan;
  const DataWisataSimpanLoadFailure({required this.pesan});
}
