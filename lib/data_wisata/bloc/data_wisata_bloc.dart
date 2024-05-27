import 'dart:developer';

import 'package:async/async.dart';
import 'package:recomend_toba/home/filter_pencarian.dart';
import 'package:cancelable_retry/cancelable_retry.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_api.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:recomend_toba/data_wisata/repo/data_wisata_remote.dart';
import 'package:recomend_toba/home/pencarian_wisata_screen.dart';
// import 'package:recomend_toba/data_wisata/repo/DataWisata_local.dart';
import 'package:recomend_toba/utils/network_info.dart';

class DataWisataBloc extends Bloc<DataWisataEvent, DataWisataState> {
  DataWisataRemote remoteRepo = DataWisataRemote();
  // DataWisataLocal localRepo = DataWisataLocal();
  NetworkInfo networkInfo = NetworkInfo();
  CancelableRetry<Result<DataWisataApi>>? request;

  DataWisataBloc() : super(DataWisataInitial()) {
    on<FetchDataWisata>(((event, emit) async {
      emit(DataWisataLoading());
      // if (!await networkInfo.isConnected) {
      //   emit(DataWisataNoInternet());
      //   return;
      // }
      await Future.delayed(Duration(seconds: 2));

      try {
        // final DataWisataApi response = await remoteRepo.getData(event.filter);

        request = CancelableRetry<Result<DataWisataApi>>(
          () async {
            try {
              var res = await remoteRepo.getData(event.filter);
              return Result.value(res);
            } catch (error, stacktrace) {
              Logger().e(error.toString());
              return Result.error(
                DataWisataApi("retry", []),
              );
            }
          },
          delayFactor: const Duration(milliseconds: 5000),
          randomizationFactor: 0.25,
          retryIf: (r) {
            if (r.isError) {
              var e = r.asError!.error as DataWisataApi;
              return e.status == 'retry';
            }
            return false;
          },
        );

        final res = await request!.run();

        if (res.isValue) {
          final DataWisataApi response = res.asValue!.value;
          emit(DataWisataLoadSuccess(data: response));
        }

        if (res.isError) {
          Logger().e(res.asError!.error.toString());
          // emit(DataWisataLoadFailure(pesan: res.asError!.error.toString()));
          emit(
            const DataWisataLoadFailure(
              pesan:
                  "Tidak dapat mengambil data, Pastikan hp terhubung ke internet",
            ),
          );
        }

        // emit(DataWisataLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(const DataWisataLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet"));
      }
    }));

    on<FetchPencarianWisata>(((event, emit) async {
      emit(DataWisataLoading());
      if (!await networkInfo.isConnected) {
        emit(DataWisataNoInternet());
        return;
      }
      await Future.delayed(Duration(seconds: 2));

      try {
        final DataWisataApi response =
            await remoteRepo.getPecarian(event.filter);

        emit(DataWisataLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataWisataLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet",
          ),
        );
      }
    }));

    on<FetchRekomendasiWisata>(((event, emit) async {
      emit(DataWisataLoading());
      if (!await networkInfo.isConnected) {
        emit(DataWisataNoInternet());
        return;
      }
      await Future.delayed(const Duration(seconds: 2));

      try {
        log('filter = ${event.filter}');
        
        final DataWisataApi response =
            await remoteRepo.getRekomendasi(event.filter);

        emit(DataWisataLoadSuccess(data: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(
          const DataWisataLoadFailure(
            pesan:
                "Tidak dapat mengambil data, Pastikan hp terhubung ke internet",
          ),
        );
      }
    }));
  }

  @override
  Future<void> close() {
    request?.cancel();

    return super.close();
  }
}

/*
BLOC EVENT
*/
abstract class DataWisataEvent extends Equatable {
  const DataWisataEvent();

  @override
  List<Object> get props => [];
}

class FetchRekomendasiWisata extends DataWisataEvent {
  final FilterPencarian filter;

  const FetchRekomendasiWisata(this.filter);
}

class FetchPencarianWisata extends DataWisataEvent {
  final FilterPencarian filter;

  const FetchPencarianWisata(this.filter);
}

class FetchDataWisata extends DataWisataEvent {
  final DataFilter filter;

  const FetchDataWisata(this.filter);
}

/*
BLOC STATE
*/
abstract class DataWisataState extends Equatable {
  const DataWisataState();

  @override
  List<Object> get props => [];
}

class DataWisataInitial extends DataWisataState {}

class DataWisataLoading extends DataWisataState {}

class DataWisataLoadSuccess extends DataWisataState {
  final DataWisataApi data;
  const DataWisataLoadSuccess({required this.data});
}

class DataWisataNoInternet extends DataWisataState {}

class DataWisataLoadFailure extends DataWisataState {
  final String pesan;
  const DataWisataLoadFailure({required this.pesan});
}
