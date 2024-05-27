import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recomend_toba/data_admin/bloc/data_admin_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_hapus_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_simpan_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_ubah_bloc.dart';
import 'package:recomend_toba/data_admin/data_admin_screen.dart';
import 'package:recomend_toba/data_admin/data_admin_tambah.dart';
import 'package:recomend_toba/data_admin/data_admin_ubah.dart';

import 'package:recomend_toba/data_bobot/bloc/data_bobot_bloc.dart';
import 'package:recomend_toba/data_bobot/bloc/data_bobot_hapus_bloc.dart';
import 'package:recomend_toba/data_bobot/bloc/data_bobot_simpan_bloc.dart';
import 'package:recomend_toba/data_bobot/bloc/data_bobot_ubah_bloc.dart';
import 'package:recomend_toba/data_bobot/data_bobot_screen.dart';
import 'package:recomend_toba/data_bobot/data_bobot_tambah.dart';
import 'package:recomend_toba/data_bobot/data_bobot_ubah.dart';

import 'package:recomend_toba/data_harga_tiket/bloc/data_harga_tiket_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/bloc/data_harga_tiket_hapus_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/bloc/data_harga_tiket_simpan_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/bloc/data_harga_tiket_ubah_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/data_harga_tiket_screen.dart';
import 'package:recomend_toba/data_harga_tiket/data_harga_tiket_tambah.dart';
import 'package:recomend_toba/data_harga_tiket/data_harga_tiket_ubah.dart';

import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_hapus_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_simpan_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_ubah_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_screen.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_tambah.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_ubah.dart';

import 'package:recomend_toba/data_jam_operasional/bloc/data_jam_operasional_bloc.dart';
import 'package:recomend_toba/data_jam_operasional/bloc/data_jam_operasional_hapus_bloc.dart';
import 'package:recomend_toba/data_jam_operasional/bloc/data_jam_operasional_simpan_bloc.dart';
import 'package:recomend_toba/data_jam_operasional/bloc/data_jam_operasional_ubah_bloc.dart';
import 'package:recomend_toba/data_jam_operasional/data_jam_operasional_screen.dart';
import 'package:recomend_toba/data_jam_operasional/data_jam_operasional_tambah.dart';
import 'package:recomend_toba/data_jam_operasional/data_jam_operasional_ubah.dart';

import 'package:recomend_toba/data_jenis_wisata/bloc/data_jenis_wisata_bloc.dart';
import 'package:recomend_toba/data_jenis_wisata/bloc/data_jenis_wisata_hapus_bloc.dart';
import 'package:recomend_toba/data_jenis_wisata/bloc/data_jenis_wisata_simpan_bloc.dart';
import 'package:recomend_toba/data_jenis_wisata/bloc/data_jenis_wisata_ubah_bloc.dart';
import 'package:recomend_toba/data_jenis_wisata/data_jenis_wisata_screen.dart';
import 'package:recomend_toba/data_jenis_wisata/data_jenis_wisata_tambah.dart';
import 'package:recomend_toba/data_jenis_wisata/data_jenis_wisata_ubah.dart';

import 'package:recomend_toba/data_rating/bloc/data_rating_bloc.dart';
import 'package:recomend_toba/data_rating/bloc/data_rating_hapus_bloc.dart';
import 'package:recomend_toba/data_rating/bloc/data_rating_simpan_bloc.dart';
import 'package:recomend_toba/data_rating/bloc/data_rating_ubah_bloc.dart';
import 'package:recomend_toba/data_rating/data_rating_screen.dart';
import 'package:recomend_toba/data_rating/data_rating_tambah.dart';
import 'package:recomend_toba/data_rating/data_rating_ubah.dart';

import 'package:recomend_toba/data_wilayah/bloc/data_wilayah_bloc.dart';
import 'package:recomend_toba/data_wilayah/bloc/data_wilayah_hapus_bloc.dart';
import 'package:recomend_toba/data_wilayah/bloc/data_wilayah_simpan_bloc.dart';
import 'package:recomend_toba/data_wilayah/bloc/data_wilayah_ubah_bloc.dart';
import 'package:recomend_toba/data_wilayah/data_wilayah_screen.dart';
import 'package:recomend_toba/data_wilayah/data_wilayah_tambah.dart';
import 'package:recomend_toba/data_wilayah/data_wilayah_ubah.dart';

import 'package:recomend_toba/data_wisata/bloc/data_wisata_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_hapus_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_simpan_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_ubah_bloc.dart';
import 'package:recomend_toba/data_wisata/data_wisata_detail_screen.dart';
import 'package:recomend_toba/data_wisata/data_wisata_screen.dart';
import 'package:recomend_toba/data_wisata/data_wisata_tambah.dart';
import 'package:recomend_toba/data_wisata/data_wisata_ubah.dart';
import 'package:recomend_toba/home/pencarian_wisata_screen.dart';
import 'package:recomend_toba/home/rekomendasi_wisata_screen.dart';

class Routes {
  static final datas = {
    DataAdminScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataAdminBloc>(
              create: (BuildContext context) => DataAdminBloc(),
            ),
            BlocProvider<DataAdminHapusBloc>(
              create: (BuildContext context) => DataAdminHapusBloc(),
            ),
            BlocProvider<DataAdminUbahBloc>(
              create: (BuildContext context) => DataAdminUbahBloc(),
            ),
            BlocProvider<DataAdminSimpanBloc>(
              create: (BuildContext context) => DataAdminSimpanBloc(),
            ),
          ],
          child: const DataAdminScreen(),
        ),
    DataAdminTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataAdminBloc>(
              create: (BuildContext context) => DataAdminBloc(),
            ),
            BlocProvider<DataAdminHapusBloc>(
              create: (BuildContext context) => DataAdminHapusBloc(),
            ),
            BlocProvider<DataAdminUbahBloc>(
              create: (BuildContext context) => DataAdminUbahBloc(),
            ),
            BlocProvider<DataAdminSimpanBloc>(
              create: (BuildContext context) => DataAdminSimpanBloc(),
            ),
          ],
          child: const DataAdminTambahScreen(),
        ),
    DataAdminUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataAdminBloc>(
              create: (BuildContext context) => DataAdminBloc(),
            ),
            BlocProvider<DataAdminHapusBloc>(
              create: (BuildContext context) => DataAdminHapusBloc(),
            ),
            BlocProvider<DataAdminUbahBloc>(
              create: (BuildContext context) => DataAdminUbahBloc(),
            ),
            BlocProvider<DataAdminSimpanBloc>(
              create: (BuildContext context) => DataAdminSimpanBloc(),
            ),
          ],
          child: const DataAdminUbahScreen(),
        ),
    DataBobotScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataBobotBloc>(
              create: (BuildContext context) => DataBobotBloc(),
            ),
            BlocProvider<DataBobotHapusBloc>(
              create: (BuildContext context) => DataBobotHapusBloc(),
            ),
            BlocProvider<DataBobotUbahBloc>(
              create: (BuildContext context) => DataBobotUbahBloc(),
            ),
            BlocProvider<DataBobotSimpanBloc>(
              create: (BuildContext context) => DataBobotSimpanBloc(),
            ),
          ],
          child: const DataBobotScreen(),
        ),
    DataBobotTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataBobotBloc>(
              create: (BuildContext context) => DataBobotBloc(),
            ),
            BlocProvider<DataBobotHapusBloc>(
              create: (BuildContext context) => DataBobotHapusBloc(),
            ),
            BlocProvider<DataBobotUbahBloc>(
              create: (BuildContext context) => DataBobotUbahBloc(),
            ),
            BlocProvider<DataBobotSimpanBloc>(
              create: (BuildContext context) => DataBobotSimpanBloc(),
            ),
          ],
          child: const DataBobotTambahScreen(),
        ),
    DataBobotUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataBobotBloc>(
              create: (BuildContext context) => DataBobotBloc(),
            ),
            BlocProvider<DataBobotHapusBloc>(
              create: (BuildContext context) => DataBobotHapusBloc(),
            ),
            BlocProvider<DataBobotUbahBloc>(
              create: (BuildContext context) => DataBobotUbahBloc(),
            ),
            BlocProvider<DataBobotSimpanBloc>(
              create: (BuildContext context) => DataBobotSimpanBloc(),
            ),
          ],
          child: const DataBobotUbahScreen(),
        ),
    DataHargaTiketScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataHargaTiketBloc>(
              create: (BuildContext context) => DataHargaTiketBloc(),
            ),
            BlocProvider<DataHargaTiketHapusBloc>(
              create: (BuildContext context) => DataHargaTiketHapusBloc(),
            ),
            BlocProvider<DataHargaTiketUbahBloc>(
              create: (BuildContext context) => DataHargaTiketUbahBloc(),
            ),
            BlocProvider<DataHargaTiketSimpanBloc>(
              create: (BuildContext context) => DataHargaTiketSimpanBloc(),
            ),
          ],
          child: const DataHargaTiketScreen(),
        ),
    DataHargaTiketTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataHargaTiketBloc>(
              create: (BuildContext context) => DataHargaTiketBloc(),
            ),
            BlocProvider<DataHargaTiketHapusBloc>(
              create: (BuildContext context) => DataHargaTiketHapusBloc(),
            ),
            BlocProvider<DataHargaTiketUbahBloc>(
              create: (BuildContext context) => DataHargaTiketUbahBloc(),
            ),
            BlocProvider<DataHargaTiketSimpanBloc>(
              create: (BuildContext context) => DataHargaTiketSimpanBloc(),
            ),
          ],
          child: const DataHargaTiketTambahScreen(),
        ),
    DataHargaTiketUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataHargaTiketBloc>(
              create: (BuildContext context) => DataHargaTiketBloc(),
            ),
            BlocProvider<DataHargaTiketHapusBloc>(
              create: (BuildContext context) => DataHargaTiketHapusBloc(),
            ),
            BlocProvider<DataHargaTiketUbahBloc>(
              create: (BuildContext context) => DataHargaTiketUbahBloc(),
            ),
            BlocProvider<DataHargaTiketSimpanBloc>(
              create: (BuildContext context) => DataHargaTiketSimpanBloc(),
            ),
          ],
          child: const DataHargaTiketUbahScreen(),
        ),
    DataHariOperasionalScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataHariOperasionalBloc>(
              create: (BuildContext context) => DataHariOperasionalBloc(),
            ),
            BlocProvider<DataHariOperasionalHapusBloc>(
              create: (BuildContext context) => DataHariOperasionalHapusBloc(),
            ),
            BlocProvider<DataHariOperasionalUbahBloc>(
              create: (BuildContext context) => DataHariOperasionalUbahBloc(),
            ),
            BlocProvider<DataHariOperasionalSimpanBloc>(
              create: (BuildContext context) => DataHariOperasionalSimpanBloc(),
            ),
          ],
          child: const DataHariOperasionalScreen(),
        ),
    DataHariOperasionalTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataHariOperasionalBloc>(
              create: (BuildContext context) => DataHariOperasionalBloc(),
            ),
            BlocProvider<DataHariOperasionalHapusBloc>(
              create: (BuildContext context) => DataHariOperasionalHapusBloc(),
            ),
            BlocProvider<DataHariOperasionalUbahBloc>(
              create: (BuildContext context) => DataHariOperasionalUbahBloc(),
            ),
            BlocProvider<DataHariOperasionalSimpanBloc>(
              create: (BuildContext context) => DataHariOperasionalSimpanBloc(),
            ),
          ],
          child: const DataHariOperasionalTambahScreen(),
        ),
    DataHariOperasionalUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataHariOperasionalBloc>(
              create: (BuildContext context) => DataHariOperasionalBloc(),
            ),
            BlocProvider<DataHariOperasionalHapusBloc>(
              create: (BuildContext context) => DataHariOperasionalHapusBloc(),
            ),
            BlocProvider<DataHariOperasionalUbahBloc>(
              create: (BuildContext context) => DataHariOperasionalUbahBloc(),
            ),
            BlocProvider<DataHariOperasionalSimpanBloc>(
              create: (BuildContext context) => DataHariOperasionalSimpanBloc(),
            ),
          ],
          child: const DataHariOperasionalUbahScreen(),
        ),
    DataJamOperasionalScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataJamOperasionalBloc>(
              create: (BuildContext context) => DataJamOperasionalBloc(),
            ),
            BlocProvider<DataJamOperasionalHapusBloc>(
              create: (BuildContext context) => DataJamOperasionalHapusBloc(),
            ),
            BlocProvider<DataJamOperasionalUbahBloc>(
              create: (BuildContext context) => DataJamOperasionalUbahBloc(),
            ),
            BlocProvider<DataJamOperasionalSimpanBloc>(
              create: (BuildContext context) => DataJamOperasionalSimpanBloc(),
            ),
          ],
          child: const DataJamOperasionalScreen(),
        ),
    DataJamOperasionalTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataJamOperasionalBloc>(
              create: (BuildContext context) => DataJamOperasionalBloc(),
            ),
            BlocProvider<DataJamOperasionalHapusBloc>(
              create: (BuildContext context) => DataJamOperasionalHapusBloc(),
            ),
            BlocProvider<DataJamOperasionalUbahBloc>(
              create: (BuildContext context) => DataJamOperasionalUbahBloc(),
            ),
            BlocProvider<DataJamOperasionalSimpanBloc>(
              create: (BuildContext context) => DataJamOperasionalSimpanBloc(),
            ),
          ],
          child: const DataJamOperasionalTambahScreen(),
        ),
    DataJamOperasionalUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataJamOperasionalBloc>(
              create: (BuildContext context) => DataJamOperasionalBloc(),
            ),
            BlocProvider<DataJamOperasionalHapusBloc>(
              create: (BuildContext context) => DataJamOperasionalHapusBloc(),
            ),
            BlocProvider<DataJamOperasionalUbahBloc>(
              create: (BuildContext context) => DataJamOperasionalUbahBloc(),
            ),
            BlocProvider<DataJamOperasionalSimpanBloc>(
              create: (BuildContext context) => DataJamOperasionalSimpanBloc(),
            ),
          ],
          child: const DataJamOperasionalUbahScreen(),
        ),
    DataJenisWisataScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataJenisWisataBloc>(
              create: (BuildContext context) => DataJenisWisataBloc(),
            ),
            BlocProvider<DataJenisWisataHapusBloc>(
              create: (BuildContext context) => DataJenisWisataHapusBloc(),
            ),
            BlocProvider<DataJenisWisataUbahBloc>(
              create: (BuildContext context) => DataJenisWisataUbahBloc(),
            ),
            BlocProvider<DataJenisWisataSimpanBloc>(
              create: (BuildContext context) => DataJenisWisataSimpanBloc(),
            ),
          ],
          child: const DataJenisWisataScreen(),
        ),
    DataJenisWisataTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataJenisWisataBloc>(
              create: (BuildContext context) => DataJenisWisataBloc(),
            ),
            BlocProvider<DataJenisWisataHapusBloc>(
              create: (BuildContext context) => DataJenisWisataHapusBloc(),
            ),
            BlocProvider<DataJenisWisataUbahBloc>(
              create: (BuildContext context) => DataJenisWisataUbahBloc(),
            ),
            BlocProvider<DataJenisWisataSimpanBloc>(
              create: (BuildContext context) => DataJenisWisataSimpanBloc(),
            ),
          ],
          child: const DataJenisWisataTambahScreen(),
        ),
    DataJenisWisataUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataJenisWisataBloc>(
              create: (BuildContext context) => DataJenisWisataBloc(),
            ),
            BlocProvider<DataJenisWisataHapusBloc>(
              create: (BuildContext context) => DataJenisWisataHapusBloc(),
            ),
            BlocProvider<DataJenisWisataUbahBloc>(
              create: (BuildContext context) => DataJenisWisataUbahBloc(),
            ),
            BlocProvider<DataJenisWisataSimpanBloc>(
              create: (BuildContext context) => DataJenisWisataSimpanBloc(),
            ),
          ],
          child: const DataJenisWisataUbahScreen(),
        ),
    DataRatingScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataRatingBloc>(
              create: (BuildContext context) => DataRatingBloc(),
            ),
            BlocProvider<DataRatingHapusBloc>(
              create: (BuildContext context) => DataRatingHapusBloc(),
            ),
            BlocProvider<DataRatingUbahBloc>(
              create: (BuildContext context) => DataRatingUbahBloc(),
            ),
            BlocProvider<DataRatingSimpanBloc>(
              create: (BuildContext context) => DataRatingSimpanBloc(),
            ),
          ],
          child: const DataRatingScreen(),
        ),
    DataRatingTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataRatingBloc>(
              create: (BuildContext context) => DataRatingBloc(),
            ),
            BlocProvider<DataRatingHapusBloc>(
              create: (BuildContext context) => DataRatingHapusBloc(),
            ),
            BlocProvider<DataRatingUbahBloc>(
              create: (BuildContext context) => DataRatingUbahBloc(),
            ),
            BlocProvider<DataRatingSimpanBloc>(
              create: (BuildContext context) => DataRatingSimpanBloc(),
            ),
          ],
          child: const DataRatingTambahScreen(),
        ),
    DataRatingUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataRatingBloc>(
              create: (BuildContext context) => DataRatingBloc(),
            ),
            BlocProvider<DataRatingHapusBloc>(
              create: (BuildContext context) => DataRatingHapusBloc(),
            ),
            BlocProvider<DataRatingUbahBloc>(
              create: (BuildContext context) => DataRatingUbahBloc(),
            ),
            BlocProvider<DataRatingSimpanBloc>(
              create: (BuildContext context) => DataRatingSimpanBloc(),
            ),
          ],
          child: const DataRatingUbahScreen(),
        ),
    DataWilayahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWilayahBloc>(
              create: (BuildContext context) => DataWilayahBloc(),
            ),
            BlocProvider<DataWilayahHapusBloc>(
              create: (BuildContext context) => DataWilayahHapusBloc(),
            ),
            BlocProvider<DataWilayahUbahBloc>(
              create: (BuildContext context) => DataWilayahUbahBloc(),
            ),
            BlocProvider<DataWilayahSimpanBloc>(
              create: (BuildContext context) => DataWilayahSimpanBloc(),
            ),
          ],
          child: const DataWilayahScreen(),
        ),
    DataWilayahTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWilayahBloc>(
              create: (BuildContext context) => DataWilayahBloc(),
            ),
            BlocProvider<DataWilayahHapusBloc>(
              create: (BuildContext context) => DataWilayahHapusBloc(),
            ),
            BlocProvider<DataWilayahUbahBloc>(
              create: (BuildContext context) => DataWilayahUbahBloc(),
            ),
            BlocProvider<DataWilayahSimpanBloc>(
              create: (BuildContext context) => DataWilayahSimpanBloc(),
            ),
          ],
          child: const DataWilayahTambahScreen(),
        ),
    DataWilayahUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWilayahBloc>(
              create: (BuildContext context) => DataWilayahBloc(),
            ),
            BlocProvider<DataWilayahHapusBloc>(
              create: (BuildContext context) => DataWilayahHapusBloc(),
            ),
            BlocProvider<DataWilayahUbahBloc>(
              create: (BuildContext context) => DataWilayahUbahBloc(),
            ),
            BlocProvider<DataWilayahSimpanBloc>(
              create: (BuildContext context) => DataWilayahSimpanBloc(),
            ),
          ],
          child: const DataWilayahUbahScreen(),
        ),
    RekomendasiWisataScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWisataBloc>(
              create: (BuildContext context) => DataWisataBloc(),
            ),
            BlocProvider<DataWisataHapusBloc>(
              create: (BuildContext context) => DataWisataHapusBloc(),
            ),
            BlocProvider<DataWisataUbahBloc>(
              create: (BuildContext context) => DataWisataUbahBloc(),
            ),
            BlocProvider<DataWisataSimpanBloc>(
              create: (BuildContext context) => DataWisataSimpanBloc(),
            ),
          ],
          child: const RekomendasiWisataScreen(),
        ),
    DataWisataDetailScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWisataBloc>(
              create: (BuildContext context) => DataWisataBloc(),
            ),
            BlocProvider<DataWisataHapusBloc>(
              create: (BuildContext context) => DataWisataHapusBloc(),
            ),
            BlocProvider<DataWisataUbahBloc>(
              create: (BuildContext context) => DataWisataUbahBloc(),
            ),
            BlocProvider<DataWisataSimpanBloc>(
              create: (BuildContext context) => DataWisataSimpanBloc(),
            ),
          ],
          child: const DataWisataDetailScreen(),
        ),
    PencarianWisataScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWisataBloc>(
              create: (BuildContext context) => DataWisataBloc(),
            ),
            BlocProvider<DataWisataHapusBloc>(
              create: (BuildContext context) => DataWisataHapusBloc(),
            ),
            BlocProvider<DataWisataUbahBloc>(
              create: (BuildContext context) => DataWisataUbahBloc(),
            ),
            BlocProvider<DataWisataSimpanBloc>(
              create: (BuildContext context) => DataWisataSimpanBloc(),
            ),
          ],
          child: const PencarianWisataScreen(),
        ),
    DataWisataScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWisataBloc>(
              create: (BuildContext context) => DataWisataBloc(),
            ),
            BlocProvider<DataWisataHapusBloc>(
              create: (BuildContext context) => DataWisataHapusBloc(),
            ),
            BlocProvider<DataWisataUbahBloc>(
              create: (BuildContext context) => DataWisataUbahBloc(),
            ),
            BlocProvider<DataWisataSimpanBloc>(
              create: (BuildContext context) => DataWisataSimpanBloc(),
            ),
          ],
          child: const DataWisataScreen(),
        ),
    DataWisataTambahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWisataBloc>(
              create: (BuildContext context) => DataWisataBloc(),
            ),
            BlocProvider<DataWisataHapusBloc>(
              create: (BuildContext context) => DataWisataHapusBloc(),
            ),
            BlocProvider<DataWisataUbahBloc>(
              create: (BuildContext context) => DataWisataUbahBloc(),
            ),
            BlocProvider<DataWisataSimpanBloc>(
              create: (BuildContext context) => DataWisataSimpanBloc(),
            ),
          ],
          child: const DataWisataTambahScreen(),
        ),
    DataWisataUbahScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<DataWisataBloc>(
              create: (BuildContext context) => DataWisataBloc(),
            ),
            BlocProvider<DataWisataHapusBloc>(
              create: (BuildContext context) => DataWisataHapusBloc(),
            ),
            BlocProvider<DataWisataUbahBloc>(
              create: (BuildContext context) => DataWisataUbahBloc(),
            ),
            BlocProvider<DataWisataSimpanBloc>(
              create: (BuildContext context) => DataWisataSimpanBloc(),
            ),
          ],
          child: const DataWisataUbahScreen(),
        ),
  };
}
