import 'package:flutter/material.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';
import 'package:recomend_toba/config/config_global.dart';

const bool showImageCard = true;

class DataHariOperasionalTampil extends StatefulWidget {
  final DataHariOperasionalApiData data;
  final Function(DataHariOperasionalApiData value) onTapEdit;
  final Function(DataHariOperasionalApiData value) onTapHapus;

  const DataHariOperasionalTampil({
    super.key,
    required this.data,
    required this.onTapEdit,
    required this.onTapHapus,
  });

  @override
  State<DataHariOperasionalTampil> createState() =>
      _DataHariOperasionalTampilState();
}

class _DataHariOperasionalTampilState extends State<DataHariOperasionalTampil> {
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
                  "#${widget.data.idHariOperasional}",
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
              "Id Hari Operasional : ${widget.data.idHariOperasional}",
              style: const TextStyle(fontSize: 16),
            ),
*/

            Text(
              "Hari Operasional : ${widget.data.hariOperasional}",
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
