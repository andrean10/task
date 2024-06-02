import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/bloc/data_harga_tiket_ubah_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_apidata.dart';

const bool showImageCard = false;

class DataHargaTiketTampilSelect extends StatefulWidget {
  final DataHargaTiketApiData data;
  const DataHargaTiketTampilSelect({super.key, required this.data});

  @override
  State<DataHargaTiketTampilSelect> createState() =>
      _DataHargaTiketTampilSelectState();
}

class _DataHargaTiketTampilSelectState
    extends State<DataHargaTiketTampilSelect> {
  final hargaTiketController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    // final bloc = BlocProvider.of<DataHargaTiketUbahBloc>(context);

    // debugPrint('debug: bloc = ${context.read<DataHargaTiketUbahBloc>()}');

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
                    widget.data.hargaTiket ?? "-",
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
                      nilai: hargaTiketController.value.text,
                    );
                    Navigator.pop(context, newData);
                  },
                  icon: const Icon(Icons.arrow_circle_right),
                ),
              ],
            ),
            // Text(widget.data.idHargaTiket ?? '-')
          ],
        ),
      ),
    );
  }
}
