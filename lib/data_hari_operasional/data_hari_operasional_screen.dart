import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_hapus_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_simpan_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_ubah_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_tambah.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_tampil.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_tampil_select.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_ubah.dart';
import 'package:recomend_toba/widgets/loading_widget.dart';
import 'package:recomend_toba/widgets/tombol.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'data/data_hari_operasional.dart';

class DataHariOperasionalScreen extends StatefulWidget {
  static const routeName = '/data_hari_operasional';

  const DataHariOperasionalScreen({super.key});

  @override
  State<DataHariOperasionalScreen> createState() =>
      _DataHariOperasionalScreenState();
}

class _DataHariOperasionalScreenState extends State<DataHariOperasionalScreen> {
  DataFilter filter = const DataFilter();

  List<Map<String, dynamic>> listPencarian = [
    {"key": "id_hari_operasional", "value": "Id Hari Operasional"},
    {"key": "hari_operasional", "value": "Hari Operasional"},
    {"key": "nilai", "value": "Nilai"},
  ];

  String valuePencarian = "id_hari_operasional";

  var pencarianController = TextEditingController();
  var waktuController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Hari Operasional',
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DataHariOperasionalHapusBloc,
              DataHariOperasionalHapusState>(
            listener: (context, state) {
              if (state is DataHariOperasionalHapusLoadSuccess) {
                fetchData();
              }
            },
          ),
          BlocListener<DataHariOperasionalUbahBloc,
              DataHariOperasionalUbahState>(
            listener: (context, state) {
              if (state is DataHariOperasionalUbahLoadSuccess) {
                fetchData();
              }
            },
          ),
          BlocListener<DataHariOperasionalSimpanBloc,
              DataHariOperasionalSimpanState>(
            listener: (context, state) {
              if (state is DataHariOperasionalSimpanLoadSuccess) {
                fetchData();
              }
            },
          ),
        ],
        child: Stack(
          children: [
            ListView(
              children: [
                Image.asset(
                  "assets/background_data.png",
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 10,
              child: Image.asset(
                "assets/avatar.png",
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: const Text(
                        "Silahkan Input Data Hari Operasional",
                        style: TextStyle(fontSize: 18),
                      ),
                    ), */
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // TombolTambahWidget(
                          //   onPress: () async {
                          //     await Navigator.pushNamed(
                          //       context,
                          //       DataHariOperasionalTambahScreen.routeName,
                          //       arguments: DataHariOperasionalTambahArguments(
                          //         data: DataHariOperasional(),
                          //         judul: "Tambah Data Hari Operasional",
                          //       ),
                          //     );
                          //     fetchData();
                          //   },
                          // ),
                          const SizedBox(width: 3),
                          TombolRefreshWidget(
                            onPress: () {
                              fetchData();
                            },
                          ),
                          // const SizedBox(width: 10),
                          // TombolCariWidget(
                          //   onPress: () async {
                          //     await _showPencarianDialog();
                          //     setState(() {});
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    if (pencarianController.text.isNotEmpty ||
                        waktuController.text.isNotEmpty)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            children: [
                              Expanded(
                                child: resultPencarian(valuePencarian),
                              ),
                              TextButton(
                                onPressed: () {
                                  filter = filter.copyWith(
                                    berdasarkan: "",
                                    isi: "",
                                  );
                                  fetchData();
                                  setState(() {
                                    pencarianController.text = "";
                                    waktuController.text = "";
                                  });
                                },
                                child: Text("Reset"),
                              )
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Builder(builder: (context) {
                        final stateData =
                            context.watch<DataHariOperasionalBloc>().state;
                        final stateHapus =
                            context.watch<DataHariOperasionalHapusBloc>().state;
                        if (stateData is DataHariOperasionalLoading ||
                            stateHapus is DataHariOperasionalHapusLoading) {
                          return const LoadingWidget();
                        }
                        if (stateData is DataHariOperasionalLoadSuccess) {
                          List<DataHariOperasionalApiData> data =
                              stateData.data.result;
                          if (data.isEmpty) {
                            return NoInternetWidget(
                              pesan: "Maaf, data masih kosong!",
                            );
                          }
                          return ListView.builder(
                            /* physics: const NeverScrollableScrollPhysics(), */
                            /* shrinkWrap: true, */
                            itemCount: data.length,
                            itemBuilder: ((context, index) {
                              return DataHariOperasionalTampilSelect(
                                data: data[index],
                              );
                            }),
                          );
                        }
                        if (stateData is DataHariOperasionalLoadFailure) {
                          return NoInternetWidget(pesan: stateData.pesan);
                        }
                        return NoInternetWidget();
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showPencarianDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Pencarian'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  DropdownButtonFormField<String>(
                    isExpanded: true, // biar nggak error overflow
                    value: valuePencarian,
                    decoration: const InputDecoration(
                      isDense: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        valuePencarian = value!;
                      });
                    },
                    items: listPencarian.map((Map<String, dynamic> item) {
                      return DropdownMenuItem<String>(
                        value: item["key"],
                        child: Text(
                          item["value"],
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 15),
                  Builder(builder: (context) {
                    if (isPencarianTanggal(valuePencarian)) {
                      return TextFormField(
                        controller: waktuController,
                        readOnly: true,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990, 1),
                            lastDate: DateTime(2025, 12),
                          ).then((pickedDate) {
                            if (pickedDate != null) {
                              waktuController.text =
                                  DateFormat('y-M-d').format(pickedDate);
                            }
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.book),
                          labelText: 'Waktu ',
                          labelStyle: const TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ), // Warna teks error
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ), // Border saat ada error
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0), // Border saat fokus dengan error
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Harus diisi!';
                          // }
                          return null;
                        },
                      );
                    }
                    return TextFormField(
                      controller: pencarianController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: 'Cari disini',
                        border: OutlineInputBorder(),
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Cari'),
                        onPressed: () {
                          if (isPencarianTanggal(valuePencarian)) {
                            filter = filter.copyWith(
                              berdasarkan: valuePencarian,
                              isi: waktuController.text,
                            );
                          } else {
                            filter = filter.copyWith(
                              berdasarkan: valuePencarian,
                              isi: pencarianController.text,
                            );
                          }

                          /* filter = filter.copyWith(
                            berdasarkan: valuePencarian,
                            isi: pencarianController.text,
                          ); */

                          fetchData();

                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Batal'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void getSession() async {
    var session = await ConfigSessionManager.getInstance().getData();
    if (session == null) {
      return;
    }
    filter = DataFilter(idPeserta: "${session.id}");
    fetchData();
  }

  @override
  void dispose() {
    pencarianController.dispose();
    super.dispose();
  }

  void fetchData() async {
    BlocProvider.of<DataHariOperasionalBloc>(context).add(
      FetchDataHariOperasional(filter),
    );
  }

  void prosesHapus(value) {
    BlocProvider.of<DataHariOperasionalHapusBloc>(
      context,
    ).add(
      FetchDataHariOperasionalHapus(
        data: value,
      ),
    );
  }

  bool isPencarianTanggal(String valuePencarian) {
    return valuePencarian == "waktu";
  }

  resultPencarian(valuePencarian) {
    var textPencarian =
        listPencarian.firstWhere((e) => e['key'] == valuePencarian)['value'];
    if (isPencarianTanggal(valuePencarian)) {
      return Container(
        child: Text(
            "Pencarian $textPencarian \"${ConfigGlobal.formatTanggal(waktuController.text)}\""),
      );
    }
    return Container(
      child: Text("Pencarian $textPencarian \"${pencarianController.text}\""),
    );
  }
}
