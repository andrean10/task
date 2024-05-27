import 'package:flutter/material.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_apidata.dart';
import 'package:recomend_toba/config/config_global.dart';

const bool showImageCard = true;

class DataWilayahTampil extends StatefulWidget {
  final DataWilayahApiData data;
  final Function(DataWilayahApiData value) onTapEdit;
  final Function(DataWilayahApiData value) onTapHapus;

  const DataWilayahTampil({
    super.key,
    required this.data,
    required this.onTapEdit,
    required this.onTapHapus,
  });

  @override
  State<DataWilayahTampil> createState() => _DataWilayahTampilState();
}

class _DataWilayahTampilState extends State<DataWilayahTampil> {
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
                  "#${widget.data.idWilayah}",
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
              "Id Wilayah : ${widget.data.idWilayah}",
              style: const TextStyle(fontSize: 16),
            ),
*/

            Text(
              "Wilayah : ${widget.data.wilayah}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Nilai : ${widget.data.nilai}",
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
