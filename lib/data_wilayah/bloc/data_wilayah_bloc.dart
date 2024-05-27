import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_api.dart';
import 'package:recomend_toba/data_wilayah/repo/data_wilayah_remote.dart';
// import 'package:recomend_toba/data_wilayah/repo/DataWilayah_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWilayahBloc extends Bloc<DataWilayahEvent, DataWilayahState> {
  DataWilayahRemote remoteRepo = DataWilayahRemote();
  // DataWilayahLocal localRepo = DataWilayahLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataWilayahBloc() : super(DataWilayahInitial()) {
    on<FetchDataWilayah>(((event, emit) async {
      emit(DataWilayahLoading());
      if (!await networkInfo.isConnected) {
        emit(DataWilayahNoInternet());
        return;
      }
      try {
        final DataWilayahApi response = await remoteRepo.getData(event.filter);
        emit(DataWilayahLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataWilayahLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataWilayahEvent extends Equatable {
  const DataWilayahEvent();

  @override
  List<Object> get props => [];
}

class FetchDataWilayah extends DataWilayahEvent {
  final DataFilter filter;

  const FetchDataWilayah(this.filter);
}

/*
BLOC STATE
*/
abstract class DataWilayahState extends Equatable {
  const DataWilayahState();

  @override
  List<Object> get props => [];
}

class DataWilayahInitial extends DataWilayahState {}

class DataWilayahLoading extends DataWilayahState {}

class DataWilayahLoadSuccess extends DataWilayahState {
  final DataWilayahApi data;
  const DataWilayahLoadSuccess({required this.data});
}

class DataWilayahNoInternet extends DataWilayahState {}

class DataWilayahLoadFailure extends DataWilayahState {
  final String pesan;
  const DataWilayahLoadFailure({required this.pesan});
}
