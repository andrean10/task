import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/data_katalog/bloc/data_katalog_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_hapus_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_simpan_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_ubah_bloc.dart';
import 'package:recomend_toba/home/home_screen.dart';
import 'package:recomend_toba/login/login_screen.dart';
import 'package:recomend_toba/profil/profil_screen.dart';
import 'package:recomend_toba/frame/frame_screen.dart';
import 'package:recomend_toba/routes.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_hapus_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_simpan_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_ubah_bloc.dart';
import 'package:recomend_toba/data_admin/data_admin_screen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'my_http_overrides.dart';

void main() async {
  // runApp(MyApp());

  HttpOverrides.global = MyHttpOverrides();

  // agar google map tidak crash ketika running
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
    initializeMapRenderer();
  }

  // untuk sentry logging ketika running
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://6a9c9178f2ec79cd8260848098dfcdc2@o4506834316427264.ingest.sentry.io/4506834318065664';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );
}

Completer<AndroidMapRenderer?>? _initializedRendererCompleter;

/// Initializes map renderer to the `latest` renderer type for Android platform.
///
/// The renderer must be requested before creating GoogleMap instances,
/// as the renderer can be initialized only once per application context.
Future<AndroidMapRenderer?> initializeMapRenderer() async {
  if (_initializedRendererCompleter != null) {
    return _initializedRendererCompleter!.future;
  }

  final Completer<AndroidMapRenderer?> completer =
      Completer<AndroidMapRenderer?>();
  _initializedRendererCompleter = completer;

  WidgetsFlutterBinding.ensureInitialized();

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    unawaited(mapsImplementation
        .initializeWithRenderer(AndroidMapRenderer.latest)
        .then((AndroidMapRenderer initializedRenderer) =>
            completer.complete(initializedRenderer)));
  } else {
    completer.complete(null);
  }

  return completer.future;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConfigGlobal.namaAplikasi,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      routes: {
        /* DataAdminScreen.routeName: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<DataKatalogBloc>(
                  create: (BuildContext context) => DataKatalogBloc(),
                ),
              ],
              child: const DataAdminScreen(),
            ), */
        HomeScreen.routeName: (context) => MultiBlocProvider(
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
              child: const HomeScreen(),
            ),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ...Routes.datas
      },
      theme: ThemeData(
        primaryColor: Style.buttonBackgroundColor,
        appBarTheme: const AppBarTheme(color: Style.buttonBackgroundColor),
      ),
    );
  }
}
