import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';

import 'bloc/data_hari_operasional_ubah_bloc.dart';
import 'data/data_hari_operasional.dart';

const bool showImageCard = false;

class DataHariOperasionalTampilSelect extends StatefulWidget {
  final DataHariOperasionalApiData data;
  const DataHariOperasionalTampilSelect({super.key, required this.data});

  @override
  State<DataHariOperasionalTampilSelect> createState() =>
      _DataHariOperasionalTampilSelectState();
}

class _DataHariOperasionalTampilSelectState
    extends State<DataHariOperasionalTampilSelect> {
  @override
  Widget build(BuildContext context) {
    final hariOperasionalController = TextEditingController();

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
                    widget.data.hariOperasional ?? "-",
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
                      nilai: hariOperasionalController.value.text,
                    );
                    Navigator.pop(context, newData);
                  },
                  icon: const Icon(Icons.arrow_circle_right),
                ),
              ],
            ),
            // Text(widget.data.idHariOperasional ?? '-')
          ],
        ),
      ),
    );
  }
}
