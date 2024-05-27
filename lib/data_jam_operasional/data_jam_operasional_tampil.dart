import 'package:flutter/material.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_apidata.dart';
import 'package:recomend_toba/config/config_global.dart';

const bool showImageCard = true;

class DataJamOperasionalTampil extends StatefulWidget {
  final DataJamOperasionalApiData data;
  final Function(DataJamOperasionalApiData value) onTapEdit;
  final Function(DataJamOperasionalApiData value) onTapHapus;

  const DataJamOperasionalTampil({
    super.key,
    required this.data,
    required this.onTapEdit,
    required this.onTapHapus,
  });

  @override
  State<DataJamOperasionalTampil> createState() =>
      _DataJamOperasionalTampilState();
}

class _DataJamOperasionalTampilState extends State<DataJamOperasionalTampil> {
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
                  "#${widget.data.idJamOperasional}",
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
              "Id Jam Operasional : ${widget.data.idJamOperasional}",
              style: const TextStyle(fontSize: 16),
            ),
*/

            Text(
              "Jam Operasional : ${widget.data.jamOperasional}",
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
