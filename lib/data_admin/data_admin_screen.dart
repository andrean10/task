import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_hapus_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_simpan_bloc.dart';
import 'package:recomend_toba/data_admin/bloc/data_admin_ubah_bloc.dart';
import 'package:recomend_toba/data_admin/data/data_admin_apidata.dart';
import 'package:recomend_toba/data_admin/data_admin_tambah.dart';
import 'package:recomend_toba/data_admin/data_admin_tampil.dart';
import 'package:recomend_toba/data_admin/data_admin_ubah.dart';
import 'package:recomend_toba/widgets/loading_widget.dart';
import 'package:recomend_toba/widgets/tombol.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'data/data_admin.dart';

class DataAdminScreen extends StatefulWidget {
  static const routeName = '/data_admin';

  const DataAdminScreen({super.key});

  @override
  State<DataAdminScreen> createState() => _DataAdminScreenState();
}

class _DataAdminScreenState extends State<DataAdminScreen> {
  DataFilter filter = const DataFilter();

  List<Map<String, dynamic>> listPencarian = [
    {"key": "id_admin", "value": "Id Admin"},
    {"key": "nama_lengkap", "value": "Nama Lengkap"},
    {"key": "username", "value": "Username"},
    {"key": "password", "value": "Password"},
  ];

  String valuePencarian = "id_admin";

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
          'Data Admin',
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DataAdminHapusBloc, DataAdminHapusState>(
            listener: (context, state) {
              if (state is DataAdminHapusLoadSuccess) {
                fetchData();
              }
            },
          ),
          BlocListener<DataAdminUbahBloc, DataAdminUbahState>(
            listener: (context, state) {
              if (state is DataAdminUbahLoadSuccess) {
                fetchData();
              }
            },
          ),
          BlocListener<DataAdminSimpanBloc, DataAdminSimpanState>(
            listener: (context, state) {
              if (state is DataAdminSimpanLoadSuccess) {
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
                        "Silahkan Input Data Admin",
                        style: TextStyle(fontSize: 18),
                      ),
                    ), */
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TombolTambahWidget(
                            onPress: () async {
                              await Navigator.pushNamed(
                                context,
                                DataAdminTambahScreen.routeName,
                                arguments: DataAdminTambahArguments(
                                  data: DataAdmin(),
                                  judul: "Tambah Data Admin",
                                ),
                              );
                              fetchData();
                            },
                          ),
                          const SizedBox(width: 10),
                          TombolRefreshWidget(
                            onPress: () {
                              fetchData();
                            },
                          ),
                          const SizedBox(width: 10),
                          TombolCariWidget(
                            onPress: () async {
                              await _showPencarianDialog();
                              setState(() {});
                            },
                          ),
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
                        final stateData = context.watch<DataAdminBloc>().state;
                        final stateHapus =
                            context.watch<DataAdminHapusBloc>().state;
                        if (stateData is DataAdminLoading ||
                            stateHapus is DataAdminHapusLoading) {
                          return const LoadingWidget();
                        }
                        if (stateData is DataAdminLoadSuccess) {
                          List<DataAdminApiData> data = stateData.data.result;
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
                              return DataAdminTampil(
                                data: data[index],
                                onTapHapus: (value) async {
                                  /* BlocProvider.of<DataAdminHapusBloc>(
                                    context,
                                  ).add(
                                    FetchDataAdminHapus(
                                      data: value,
                                    ),
                                  ); */

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Konfirmasi Penghapusan'),
                                        content: const Text(
                                            'Apakah Anda yakin ingin menghapus data ini?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Batal'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              prosesHapus(value);
                                              Navigator.of(context)
                                                  .pop(); // Tutup dialog
                                            },
                                            child: const Text(
                                              'Hapus',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                onTapEdit: (value) async {
                                  var data = DataAdmin(
                                    idAdmin: value.idAdmin,
                                    namaLengkap: value.namaLengkap,
                                    username: value.username,
                                    password: value.password,
                                  );
                                  await Navigator.of(context).pushNamed(
                                    DataAdminUbahScreen.routeName,
                                    arguments: DataAdminUbahArguments(
                                      data: data,
                                      judul: "Edit Data Admin",
                                    ),
                                  );
                                  fetchData();
                                },
                              );
                            }),
                          );
                        }
                        if (stateData is DataAdminLoadFailure) {
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
    BlocProvider.of<DataAdminBloc>(context).add(
      FetchDataAdmin(filter),
    );
  }

  void prosesHapus(value) {
    BlocProvider.of<DataAdminHapusBloc>(
      context,
    ).add(
      FetchDataAdminHapus(
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
