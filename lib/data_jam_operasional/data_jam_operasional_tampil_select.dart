import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_apidata.dart';

import 'bloc/data_jam_operasional_ubah_bloc.dart';
import 'data/data_jam_operasional.dart';

const bool showImageCard = false;

class DataJamOperasionalTampilSelect extends StatefulWidget {
  final DataJamOperasionalApiData data;
  const DataJamOperasionalTampilSelect({super.key, required this.data});

  @override
  State<DataJamOperasionalTampilSelect> createState() =>
      _DataJamOperasionalTampilSelectState();
}

class _DataJamOperasionalTampilSelectState
    extends State<DataJamOperasionalTampilSelect> {
  @override
  Widget build(BuildContext context) {
    final jamOperasionalController = TextEditingController();

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
                    widget.data.jamOperasional ?? "-",
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
                      nilai: jamOperasionalController.value.text,
                    );
                    Navigator.pop(context, newData);
                  },
                  icon: const Icon(Icons.arrow_circle_right),
                ),
              ],
            ),
            // Text(widget.data.idJamOperasional ?? '-')
          ],
        ),
      ),
    );
  }
}
