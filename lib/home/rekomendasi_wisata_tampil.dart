import 'package:flutter/material.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:recomend_toba/config/config_global.dart';

const bool showImageCard = true;

class RekomendasiWisataTampil extends StatefulWidget {
  final DataWisataApiData data;
  final Function(DataWisataApiData value) onTapEdit;
  final Function(DataWisataApiData value) onTapHapus;

  const RekomendasiWisataTampil({
    super.key,
    required this.data,
    required this.onTapEdit,
    required this.onTapHapus,
  });

  @override
  State<RekomendasiWisataTampil> createState() =>
      _RekomendasiWisataTampilState();
}

class _RekomendasiWisataTampilState extends State<RekomendasiWisataTampil> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showImageCard)
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Image.network(
                      "${ConfigGlobal.baseUrl}/admin/upload/${widget.data.foto}",
                      fit: BoxFit.fill,
                    ),
                  ),
                const SizedBox(height: 6),
                Text(
                  "${widget.data.namaWisata}",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${widget.data.deskripsi}",
                  style: const TextStyle(fontSize: 16),
                ),

                Text(
                  "Koordinat : ${widget.data.koordinat}",
                  style: const TextStyle(fontSize: 16),
                ),
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
          Container(
            decoration: BoxDecoration(
              color: Style.buttonBackgroundColor,
              borderRadius: BorderRadius.circular(
                10,
              ), // Adjust the value to change the radius
            ),
            margin: const EdgeInsets.all(9.0),
            padding: const EdgeInsets.all(6),
            child: Text(
              "${widget.data.score?.toStringAsFixed(3)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
