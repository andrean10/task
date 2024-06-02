import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_apidata.dart';

import 'bloc/data_wilayah_ubah_bloc.dart';
import 'data/data_wilayah.dart';

const bool showImageCard = false;

class DataWilayahTampilSelect extends StatefulWidget {
  final DataWilayahApiData data;
  const DataWilayahTampilSelect({super.key, required this.data});

  @override
  State<DataWilayahTampilSelect> createState() =>
      _DataWilayahTampilSelectState();
}

class _DataWilayahTampilSelectState extends State<DataWilayahTampilSelect> {
  final wilayahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
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
                SizedBox(
                  width: _width - 160,
                  child: Text(
                    widget.data.wilayah ?? "-",
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: false,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                //PopupMenuButton<int>(
                //onSelected: (item) {},
                //itemBuilder: (context) => [
                //const PopupMenuItem<int>(value: 0, child: Text('Edit')),
                //const PopupMenuItem<int>(value: 1, child: Text('Hapus')),
                //],
                //),
                IconButton(
                  onPressed: () {
                    final newData = widget.data.copyWith(
                      nilai: wilayahController.value.text,
                    );
                    Navigator.pop(context, newData);
                  },
                  icon: const Icon(Icons.arrow_circle_right),
                ),
              ],
            ),
            // Text(widget.data.idWilayah ?? '-')
          ],
        ),
      ),
    );
  }
}
