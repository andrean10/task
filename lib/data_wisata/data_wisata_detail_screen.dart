import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_apidata.dart';
import 'package:recomend_toba/data_harga_tiket/data_harga_tiket_screen.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_screen.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_apidata.dart';
import 'package:recomend_toba/data_jam_operasional/data_jam_operasional_screen.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_apidata.dart';
import 'package:recomend_toba/data_jenis_wisata/data_jenis_wisata_screen.dart';
import 'package:recomend_toba/data_rating/data/data_rating_apidata.dart';
import 'package:recomend_toba/data_rating/data_rating_screen.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_apidata.dart';
import 'package:recomend_toba/data_wilayah/data_wilayah_screen.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:recomend_toba/data_wisata/google_map_widget.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_bloc.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_ubah_bloc.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata.dart';
import 'package:url_launcher/url_launcher.dart';

class DataWisataDetailScreen extends StatefulWidget {
  static const routeName = "data_wisata/detail";
  const DataWisataDetailScreen({super.key});

  @override
  State<DataWisataDetailScreen> createState() => _DataWisataDetailScreenState();
}

class _DataWisataDetailScreenState extends State<DataWisataDetailScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataWisataDetailArguments? screenArgument;

  DataWisataApiData? data;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataWisataDetailArguments;

      if (screenArgument != null) {
        data = screenArgument!.data;
      }

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(screenArgument?.judul ?? "")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: data != null ? MyStatefulWidget(data: data!) : Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class DataWisataDetailArguments {
  final DataWisataApiData data;
  final String judul;

  DataWisataDetailArguments({
    required this.data,
    required this.judul,
  });
}

class MyStatefulWidget extends StatefulWidget {
  final DataWisataApiData data;

  MyStatefulWidget({super.key, required this.data});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: "${widget.data.idWisata}${widget.data.namaWisata}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "${ConfigGlobal.baseUrl}/admin/upload/${widget.data.foto}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    // const SizedBox(width: 9),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text(
                                  "${widget.data.namaWisata}",
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 9,
                bottom: 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Text(
                        "${widget.data.rating}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.book),
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${widget.data.deskripsi}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.price_change),
                          Text(
                            "Harga Tiket",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${widget.data.hargaTiket}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.calendar_view_day),
                          Text(
                            "Hari Operasional",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${widget.data.hariOperasional}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.timer),
                          Text(
                            "Jam Operasional",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${widget.data.jamOperasional}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 9),
          Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String googleMapsUrl =
                          'https://www.google.com/maps/search/?api=1&query=${widget.data.koordinat}';

                      launch(googleMapsUrl);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("PETUNJUK ARAH"),
                          Icon(Icons.route),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: GoogleMapWidget(
                      widget.data,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
