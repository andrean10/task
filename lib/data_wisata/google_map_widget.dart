import 'dart:async';
import 'package:geojson/geojson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'package:location/location.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:shimmer/shimmer.dart';

class GoogleMapWidget extends StatefulWidget {
  static const routeName = '/google_map';

  final DataWisataApiData data;

  const GoogleMapWidget(this.data);

  @override
  State<GoogleMapWidget> createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget> {
  Koordinat? lastLocation;

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};

  // GoogleMapController? mapController;

  CameraPosition _mapInitialPosition = CameraPosition(
    target: LatLng(-2.600029, 118.015776),
    zoom: 7,
  );

  List<LatLng> polylines = [];

  @override
  void initState() {
    _requestLocationPermission();

    super.initState();
  }

  showBottomSheetError({VoidCallback? onRetry}) async {
    bool? cobaLagi = await showModalBottomSheet(
      context: context,
      builder: (context) => ErrorBottomSheet(
        onRetry: () {
          Navigator.of(context).pop(true);
        },
      ),
    );
    if (cobaLagi == true) {
      if (onRetry != null) {
        onRetry();
      }
    } else {
      if (mounted) {
        Future.delayed(const Duration(milliseconds: 600), () {
          Navigator.of(context).pop();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      // myLocationEnabled: true,

      markers: _markers,
      initialCameraPosition: _mapInitialPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        // _showUserLocation();
        // mapController = controller;

        _moveCamera();
      },
    );
  }

  Location location = Location();

  Future<void> _requestLocationPermission() async {
    final hasPermission = await location.requestPermission();
    if (hasPermission == PermissionStatus.granted) {
      // startLocationUpdates();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Izin: lokasi gagal.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  // Future<void> _showUserLocation() async {
  //   final currentLocation = await location.getLocation();
  //   if (currentLocation.latitude != null && currentLocation.longitude != null) {
  //     lastLocation = Koordinat(
  //       latitude: currentLocation.latitude!,
  //       longitude: currentLocation.longitude!,
  //     );
  //     mapController?.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //           target: LatLng(
  //             currentLocation.latitude!,
  //             currentLocation.longitude!,
  //           ),
  //           zoom: 15,
  //         ),
  //       ),
  //     );
  //   }
  // }

  // CameraPosition _anotherPosition = CameraPosition(
  //   target: LatLng(-1.614708340159109, 103.62581739486991),
  //   zoom: 15.0,
  // );

  Future<void> _moveCamera() async {
    try {
      final GoogleMapController controller = await _controller.future;
      var koordinat = Koordinat.fromString("${widget.data.koordinat}");
      var _latLng = LatLng(
        koordinat.latitude,
        koordinat.longitude,
      );

      setState(() {
        _markers.clear();
        _markers.add(Marker(
          markerId: MarkerId(location.toString()),
          position: _latLng,
          infoWindow: InfoWindow(
            title: '${widget.data.namaWisata}',
            snippet: '${widget.data.deskripsi}',
          ),
        ));
      });

      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _latLng,
            zoom: 15.0,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid koordinat!'),
          duration: Duration(seconds: 10),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // StreamSubscription<LocationData>? locationSubscription;

  // void startLocationUpdates() {
  //   final location = Location();
  //   location.changeSettings(
  //     accuracy: LocationAccuracy.high,
  //     interval: 1000,
  //     distanceFilter: 1,
  //   );

  //   locationSubscription = location.onLocationChanged.listen((locationData) {
  //     if (locationData.latitude != null && locationData.longitude != null) {
  //       if (mounted) {
  //         setState(() {
  //           lastLocation = Koordinat(
  //             latitude: locationData.latitude!,
  //             longitude: locationData.longitude!,
  //           );
  //         });
  //       }
  //     }

  //     // _moveCamera();
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class Koordinat {
  double latitude;
  double longitude;

  Koordinat({required this.latitude, required this.longitude});

  factory Koordinat.fromString(String coordinateString) {
    List<String> coordinates = coordinateString.split(',');
    double lat = double.parse(coordinates[0].trim());
    double long = double.parse(coordinates[1].trim());
    return Koordinat(latitude: lat, longitude: long);
  }

  @override
  String toString() {
    return "$latitude, $longitude";
  }
}

class ShimmerJadwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorBottomSheet extends StatelessWidget {
  final Function()? onRetry;

  ErrorBottomSheet({this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ups, terjadi kesalahan',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            'Gagal memuat data. Silakan coba lagi atau keluar.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: onRetry,
            child: Text('Coba Lagi'),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
            ),
          ),
          // SizedBox(height: 8.0),
          // TextButton(
          //   onPressed: () {
          //     Navigator.of(context).pop(); // Tutup bottom sheet
          //   },
          //   child: Text('Keluar'),
          // ),
        ],
      ),
    );
  }
}

class ShimmerLoadAbsen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 6.0),
                Container(
                  width: 150.0, // Lebar teks placeholder
                  height: 16.0,
                  color: Colors.white,
                ),
                SizedBox(height: 6.0),
                Container(
                  width: double.infinity,
                  height: 40.0, // Tinggi tombol placeholder
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/success.gif", width: 50),
          SizedBox(height: 16.0),
          Text(
            'Absen berhasil',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Tutup bottom sheet
            },
            child: Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

class LoadingSearchLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset(
          "assets/location-search.gif",
        ),
        const SizedBox(width: 12),
        Text(
          "Cari lokasimu...",
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
