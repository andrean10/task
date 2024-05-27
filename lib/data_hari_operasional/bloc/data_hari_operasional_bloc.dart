import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_api.dart';
import 'package:recomend_toba/data_hari_operasional/repo/data_hari_operasional_remote.dart';
// import 'package:recomend_toba/data_hari_operasional/repo/DataHariOperasional_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataHariOperasionalBloc
    extends Bloc<DataHariOperasionalEvent, DataHariOperasionalState> {
  DataHariOperasionalRemote remoteRepo = DataHariOperasionalRemote();
  // DataHariOperasionalLocal localRepo = DataHariOperasionalLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataHariOperasionalBloc() : super(DataHariOperasionalInitial()) {
    on<FetchDataHariOperasional>(((event, emit) async {
      emit(DataHariOperasionalLoading());
      if (!await networkInfo.isConnected) {
        emit(DataHariOperasionalNoInternet());
        return;
      }
      try {
        final DataHariOperasionalApi response =
            await remoteRepo.getData(event.filter);
        emit(DataHariOperasionalLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataHariOperasionalLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataHariOperasionalEvent extends Equatable {
  const DataHariOperasionalEvent();

  @override
  List<Object> get props => [];
}

class FetchDataHariOperasional extends DataHariOperasionalEvent {
  final DataFilter filter;

  const FetchDataHariOperasional(this.filter);
}

/*
BLOC STATE
*/
abstract class DataHariOperasionalState extends Equatable {
  const DataHariOperasionalState();

  @override
  List<Object> get props => [];
}

class DataHariOperasionalInitial extends DataHariOperasionalState {}

class DataHariOperasionalLoading extends DataHariOperasionalState {}

class DataHariOperasionalLoadSuccess extends DataHariOperasionalState {
  final DataHariOperasionalApi data;
  const DataHariOperasionalLoadSuccess({required this.data});
}

class DataHariOperasionalNoInternet extends DataHariOperasionalState {}

class DataHariOperasionalLoadFailure extends DataHariOperasionalState {
  final String pesan;
  const DataHariOperasionalLoadFailure({required this.pesan});
}
