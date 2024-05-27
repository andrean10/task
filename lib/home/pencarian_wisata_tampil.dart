import 'package:flutter/material.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/data_wisata/data_wisata_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

const bool showImageCard = true;

class DataWisataTampil extends StatefulWidget {
  final DataWisataApiData data;
  final Function(DataWisataApiData value) onTapEdit;
  final Function(DataWisataApiData value) onTapHapus;

  const DataWisataTampil({
    super.key,
    required this.data,
    required this.onTapEdit,
    required this.onTapHapus,
  });

  @override
  State<DataWisataTampil> createState() => _DataWisataTampilState();
}

class _DataWisataTampilState extends State<DataWisataTampil> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              DataWisataDetailScreen.routeName,
              arguments: DataWisataDetailArguments(
                data: widget.data,
                judul: "Detail Wisata",
              ),
            );

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DataWisataDetailScreen(),
            //     settings: RouteSettings(
            //       arguments: DataWisataDetailArguments(
            //         data: widget.data,
            //         judul: "Detail Wisataaaa",
            //       ), // Menambahkan argumen di sini
            //     ),
            //   ),
            // );
          },
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showImageCard)
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Hero(
                      tag: "${widget.data.idWisata}${widget.data.namaWisata}",
                      child: Image.network(
                        "${ConfigGlobal.baseUrl}/admin/upload/${widget.data.foto}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "${widget.data.namaWisata}",
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // const Spacer(),
                    // InkWell(
                    //   onTap: () {
                    //     String googleMapsUrl =
                    //         'https://www.google.com/maps/search/?api=1&query=${widget.data.koordinat}';

                    //     // if (await canLaunch(googleMapsUrl)) {
                    //     launch(googleMapsUrl);
                    //     // }
                    //   },
                    //   child: Container(
                    //     padding: const EdgeInsets.all(6),
                    //     decoration: const BoxDecoration(
                    //       color: Colors.blue,
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: const Icon(
                    //       Icons.map_sharp,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),

                const SizedBox(height: 9),
                Text(
                  "${widget.data.deskripsi}",
                  style: const TextStyle(fontSize: 16),
                ),

                // Text(
                //   "Koordinat : ${widget.data.koordinat}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Jenis Wisata : ${widget.data.jenisWisata}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Wilayah : ${widget.data.wilayah}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Rating : ${widget.data.rating}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Harga Tiket : ${widget.data.hargaTiket}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Hari Operasional : ${widget.data.hariOperasional}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Jam Operasional : ${widget.data.jamOperasional}",
                //   style: const TextStyle(fontSize: 16),
                // ),

                /*            Text(
                  "Id Wisata : ${widget.data.idWisata}",
                  style: const TextStyle(fontSize: 16),
                ),
      */

                // Text(
                //   "Nama Wisata : ${widget.data.namaWisata}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Foto : ${widget.data.foto}",
                //   style: const TextStyle(fontSize: 16),
                // ),

                // Text(
                //   "Koordinat : ${widget.data.koordinat}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Id Jenis Wisata : ${widget.data.idJenisWisata}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Id Wilayah : ${widget.data.idWilayah}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Id Rating : ${widget.data.idRating}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Id Harga Tiket : ${widget.data.idHargaTiket}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Id Hari Operasional : ${widget.data.idHariOperasional}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // Text(
                //   "Id Jam Operasional : ${widget.data.idJamOperasional}",
                //   style: const TextStyle(fontSize: 16),
                // ),

                /* 
                Text(
                  "Hapalan: ${widget.data.hapalan}",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "Keterangan : ${widget.data.keterangan}",
                  style: const TextStyle(fontSize: 16),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
