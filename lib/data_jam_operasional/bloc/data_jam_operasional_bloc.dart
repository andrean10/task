import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_api.dart';
import 'package:recomend_toba/data_jam_operasional/repo/data_jam_operasional_remote.dart';
// import 'package:recomend_toba/data_jam_operasional/repo/DataJamOperasional_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataJamOperasionalBloc
    extends Bloc<DataJamOperasionalEvent, DataJamOperasionalState> {
  DataJamOperasionalRemote remoteRepo = DataJamOperasionalRemote();
  // DataJamOperasionalLocal localRepo = DataJamOperasionalLocal();
  NetworkInfo networkInfo = NetworkInfo();

  DataJamOperasionalBloc() : super(DataJamOperasionalInitial()) {
    on<FetchDataJamOperasional>(((event, emit) async {
      emit(DataJamOperasionalLoading());
      if (!await networkInfo.isConnected) {
        emit(DataJamOperasionalNoInternet());
        return;
      }
      try {
        final DataJamOperasionalApi response =
            await remoteRepo.getData(event.filter);
        emit(DataJamOperasionalLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataJamOperasionalLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));
  }
}

/*
BLOC EVENT
*/
abstract class DataJamOperasionalEvent extends Equatable {
  const DataJamOperasionalEvent();

  @override
  List<Object> get props => [];
}

class FetchDataJamOperasional extends DataJamOperasionalEvent {
  final DataFilter filter;

  const FetchDataJamOperasional(this.filter);
}

/*
BLOC STATE
*/
abstract class DataJamOperasionalState extends Equatable {
  const DataJamOperasionalState();

  @override
  List<Object> get props => [];
}

class DataJamOperasionalInitial extends DataJamOperasionalState {}

class DataJamOperasionalLoading extends DataJamOperasionalState {}

class DataJamOperasionalLoadSuccess extends DataJamOperasionalState {
  final DataJamOperasionalApi data;
  const DataJamOperasionalLoadSuccess({required this.data});
}

class DataJamOperasionalNoInternet extends DataJamOperasionalState {}

class DataJamOperasionalLoadFailure extends DataJamOperasionalState {
  final String pesan;
  const DataJamOperasionalLoadFailure({required this.pesan});
}
