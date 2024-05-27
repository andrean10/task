import 'package:flutter/material.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot_apidata.dart';
import 'package:recomend_toba/config/config_global.dart';

const bool showImageCard = true;

class DataBobotTampil extends StatefulWidget {
  final DataBobotApiData data;
  final Function(DataBobotApiData value) onTapEdit;
  final Function(DataBobotApiData value) onTapHapus;

  const DataBobotTampil({
    super.key,
    required this.data,
    required this.onTapEdit,
    required this.onTapHapus,
  });

  @override
  State<DataBobotTampil> createState() => _DataBobotTampilState();
}

class _DataBobotTampilState extends State<DataBobotTampil> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showImageCard)
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Image.asset(
                  "assets/background.png",
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "#${widget.data.idBobot}",
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
              "Id Bobot : ${widget.data.idBobot}",
              style: const TextStyle(fontSize: 16),
            ),
*/

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
