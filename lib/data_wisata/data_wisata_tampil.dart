import 'package:flutter/material.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:recomend_toba/config/config_global.dart';

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${widget.data.namaWisata}",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                PopupMenuButton<int>(
                  padding: const EdgeInsets.all(0),
                  onSelected: (item) {
                    if (item == 0) {
                      widget.onTapEdit(widget.data);
                      return;
                    }
                    if (item == 1) {
                      widget.onTapHapus(widget.data);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem<int>(value: 0, child: Text('Edit')),
                    const PopupMenuItem<int>(value: 1, child: Text('Hapus')),
                  ],
                ),
              ],
            ),

            /*            Text(
              "Id Wisata : ${widget.data.idWisata}",
              style: const TextStyle(fontSize: 16),
            ),
    */

            Text(
              "Deskripsi : ${widget.data.deskripsi}",
              style: const TextStyle(fontSize: 16),
            ),
            // Text(
            //   "Foto : ${widget.data.foto}",
            //   style: const TextStyle(fontSize: 16),
            // ),

            Text(
              "Koordinat : ${widget.data.koordinat}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Jenis Wisata : ${widget.data.jenisWisata}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Wilayah : ${widget.data.wilayah}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Rating : ${widget.data.rating}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Harga Tiket : ${widget.data.hargaTiket}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Hari Operasional : ${widget.data.hariOperasional}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Jam Operasional : ${widget.data.jamOperasional}",
              style: const TextStyle(fontSize: 16),
            ),

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
    );
  }
}
