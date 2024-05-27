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
                  icon: const Icon(Icons.edit_rounded),
                  onPressed: () {
                    showModalBottomSheet<DataWilayahApiData>(
                      context: context,
                      isScrollControlled: true,
                      builder: (mycontext) {
                        return Container(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(mycontext).viewInsets.bottom),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 32,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: wilayahController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: "Nilai Bobot",
                                    hintText: "Masukkan Nilai Bobot",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Nilai Bobot tidak boleh kosong";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (wilayahController.text
                                          .contains(',')) {
                                        wilayahController.text =
                                            wilayahController.text
                                                .replaceAll(',', '.');
                                      }

                                      final newData = widget.data.copyWith(
                                        nilai: wilayahController.value.text,
                                      );

                                      final bloc =
                                          context.read<DataWilayahUbahBloc>();
                                      bloc.add(
                                        FetchDataWilayahUbah(
                                          DataWilayah(
                                            idWilayah: newData.idWilayah,
                                            nilai: newData.nilai,
                                          ),
                                        ),
                                      );

                                      Navigator.pop(context);
                                    },
                                    child: const Text('Simpan'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
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
