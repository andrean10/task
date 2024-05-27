import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_apidata.dart';

import 'bloc/data_jenis_wisata_ubah_bloc.dart';
import 'data/data_jenis_wisata.dart';

const bool showImageCard = false;

class DataJenisWisataTampilSelect extends StatefulWidget {
  final DataJenisWisataApiData data;
  const DataJenisWisataTampilSelect({super.key, required this.data});

  @override
  State<DataJenisWisataTampilSelect> createState() =>
      _DataJenisWisataTampilSelectState();
}

class _DataJenisWisataTampilSelectState
    extends State<DataJenisWisataTampilSelect> {
  final jenisWisataController = TextEditingController();

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
                    widget.data.jenisWisata ?? "-",
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
                    showModalBottomSheet<DataJenisWisataApiData>(
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
                                  controller: jenisWisataController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Bobot",
                                    hintText: "Masukkan Bobot",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Bobot tidak boleh kosong";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (jenisWisataController.text
                                          .contains(',')) {
                                        jenisWisataController.text =
                                            jenisWisataController.text
                                                .replaceAll(',', '.');
                                      }

                                      final newData = widget.data.copyWith(
                                        nilai: jenisWisataController.value.text,
                                      );

                                      final bloc = context
                                          .read<DataJenisWisataUbahBloc>();
                                      bloc.add(
                                        FetchDataJenisWisataUbah(
                                          DataJenisWisata(
                                            idJenisWisata:
                                                newData.idJenisWisata,
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
                      nilai: jenisWisataController.value.text,
                    );
                    Navigator.pop(context, newData);
                  },
                  icon: const Icon(Icons.arrow_circle_right),
                ),
              ],
            ),
            // Text(widget.data.idJenisWisata ?? '-')
          ],
        ),
      ),
    );
  }
}
