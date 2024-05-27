import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket_apidata.dart';
import 'package:recomend_toba/data_harga_tiket/data_harga_tiket_screen.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional_apidata.dart';
import 'package:recomend_toba/data_hari_operasional/data_hari_operasional_screen.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional_apidata.dart';
import 'package:recomend_toba/data_jam_operasional/data_jam_operasional_screen.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata_apidata.dart';
import 'package:recomend_toba/data_jenis_wisata/data_jenis_wisata_screen.dart';
import 'package:recomend_toba/data_rating/data/data_rating_apidata.dart';
import 'package:recomend_toba/data_rating/data_rating_screen.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah_apidata.dart';
import 'package:recomend_toba/data_wilayah/data_wilayah_screen.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_simpan_bloc.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata.dart';

class DataWisataTambahScreen extends StatefulWidget {
  static const routeName = "data_wisata/tambah";
  const DataWisataTambahScreen({super.key});

  @override
  State<DataWisataTambahScreen> createState() => _DataWisataTambahScreenState();
}

class _DataWisataTambahScreenState extends State<DataWisataTambahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataWisataTambahArguments? screenArgument;

  DataWisata form = DataWisata();

  var idWisataController = TextEditingController();
  var namaWisataController = TextEditingController();
  var fotoController = TextEditingController();
  var deskripsiController = TextEditingController();
  var koordinatController = TextEditingController();
  var idJenisWisataController = TextEditingController();
  var jenisWisataController = TextEditingController();
  var idWilayahController = TextEditingController();
  var wilayahController = TextEditingController();
  var idRatingController = TextEditingController();
  var ratingController = TextEditingController();
  var idHargaTiketController = TextEditingController();
  var hargaTiketController = TextEditingController();
  var idHariOperasionalController = TextEditingController();
  var hariOperasionalController = TextEditingController();
  var idJamOperasionalController = TextEditingController();
  var jamOperasionalController = TextEditingController();

  XFile? _image;

  @override
  void initState() {
    super.initState();

    idWisataController.addListener(() {
      form.idWisata = idWisataController.text;
    });

    namaWisataController.addListener(() {
      form.namaWisata = namaWisataController.text;
    });

    fotoController.addListener(() {
      form.foto = fotoController.text;
    });

    deskripsiController.addListener(() {
      form.deskripsi = deskripsiController.text;
    });

    koordinatController.addListener(() {
      form.koordinat = koordinatController.text;
    });

    idJenisWisataController.addListener(() {
      form.idJenisWisata = idJenisWisataController.text;
    });

    idWilayahController.addListener(() {
      form.idWilayah = idWilayahController.text;
    });

    idRatingController.addListener(() {
      form.idRating = idRatingController.text;
    });

    idHargaTiketController.addListener(() {
      form.idHargaTiket = idHargaTiketController.text;
    });

    idHariOperasionalController.addListener(() {
      form.idHariOperasional = idHariOperasionalController.text;
    });

    idJamOperasionalController.addListener(() {
      form.idJamOperasional = idJamOperasionalController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataWisataTambahArguments;

      if (screenArgument != null) {}

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<DataWisataSimpanBloc>(context),
      listener: ((context, state) {
        if (state is DataWisataSimpanLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
        if (state is DataWisataSimpanLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<DataWisataSimpanBloc, DataWisataSimpanState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text(screenArgument?.judul ?? "")),
            body: SingleChildScrollView(
              child: Form(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        // const LoginDataWisataScreen(),
                        /* const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Selamat datang',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ), */

                        const SizedBox(height: 15),
                        // const SizedBox(
                        //   width: double.infinity,
                        //   child: Text(
                        //     'Silahkan lengkapi form',
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        // const SizedBox(height: 15),

                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.book),
                        //     border: OutlineInputBorder(),
                        //     labelText: 'Id Wisata',
                        //   ),
                        //   controller: idWisataController,
                        // ),
                        // const SizedBox(height: 15),

                        Card(
                          child: InkWell(
                              onTap: () async {
                                bool? oke;
                                if (_image != null) {
                                  oke = await showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            child: Text(
                                              "Ganti",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: _image != null
                                                  ? Image.file(
                                                      File(_image!.path))
                                                  : Text('No image selected'),
                                              padding: EdgeInsets.all(16.0),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );

                                  if (oke == true) {
                                    filePicker();
                                  }
                                }

                                if (_image == null) {
                                  filePicker();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: const Icon(
                                        Icons.file_upload,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 9),
                                    const Text(
                                      "Pilih Foto",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.arrow_right),
                                  ],
                                ),
                              )),
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Nama Wisata',
                          ),
                          controller: namaWisataController,
                        ),
                        const SizedBox(height: 15),

                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.book),
                        //     border: OutlineInputBorder(),
                        //     labelText: 'Foto',
                        //   ),
                        //   controller: fotoController,
                        // ),
                        // const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Deskripsi',
                          ),
                          controller: deskripsiController,
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Koordinat',
                          ),
                          controller: koordinatController,
                        ),
                        const SizedBox(height: 15),

                        // TextFormField(
                        //     readOnly: true,
                        //     decoration: const InputDecoration(
                        //       prefixIcon: Icon(Icons.book),
                        //       suffixIcon: Icon(Icons.keyboard_arrow_down),
                        //       labelText: 'Id Jenis Wisata',
                        //     ),
                        //     controller: idJenisWisataController,
                        //   ),
                        //   const SizedBox(height: 15),

                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            labelText: 'Jenis Wisata',
                          ),
                          controller: jenisWisataController,
                          onTap: () async {
                            var data = await Navigator.of(context)
                                .pushNamed(DataJenisWisataScreen.routeName);
                            if (data is DataJenisWisataApiData) {
                              jenisWisataController.text =
                                  "${data.jenisWisata}";
                              idJenisWisataController.text =
                                  "${data.idJenisWisata}";
                            }
                          },
                        ),
                        const SizedBox(height: 15),

                        // TextFormField(
                        //     readOnly: true,
                        //     decoration: const InputDecoration(
                        //       prefixIcon: Icon(Icons.book),
                        //       suffixIcon: Icon(Icons.keyboard_arrow_down),
                        //       labelText: 'Id Wilayah',
                        //     ),
                        //     controller: idWilayahController,
                        //   ),
                        //   const SizedBox(height: 15),

                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            labelText: 'Wilayah',
                          ),
                          controller: wilayahController,
                          onTap: () async {
                            var data = await Navigator.of(context)
                                .pushNamed(DataWilayahScreen.routeName);
                            if (data is DataWilayahApiData) {
                              wilayahController.text = "${data.wilayah}";
                              idWilayahController.text = "${data.idWilayah}";
                            }
                          },
                        ),
                        const SizedBox(height: 15),

                        // TextFormField(
                        //     readOnly: true,
                        //     decoration: const InputDecoration(
                        //       prefixIcon: Icon(Icons.book),
                        //       suffixIcon: Icon(Icons.keyboard_arrow_down),
                        //       labelText: 'Id Rating',
                        //     ),
                        //     controller: idRatingController,
                        //   ),
                        //   const SizedBox(height: 15),

                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            border: OutlineInputBorder(),
                            labelText: 'Rating',
                          ),
                          controller: ratingController,
                          onTap: () async {
                            var data = await Navigator.of(context)
                                .pushNamed(DataRatingScreen.routeName);
                            if (data is DataRatingApiData) {
                              ratingController.text = "${data.rating}";
                              idRatingController.text = "${data.idRating}";
                            }
                          },
                        ),
                        const SizedBox(height: 15),

                        // TextFormField(
                        //     readOnly: true,
                        //     decoration: const InputDecoration(
                        //       prefixIcon: Icon(Icons.book),
                        //       suffixIcon: Icon(Icons.keyboard_arrow_down),
                        //       labelText: 'Id Harga Tiket',
                        //     ),
                        //     controller: idHargaTiketController,
                        //   ),
                        //   const SizedBox(height: 15),

                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            border: OutlineInputBorder(),
                            labelText: 'Harga Tiket',
                          ),
                          controller: hargaTiketController,
                          onTap: () async {
                            var data = await Navigator.of(context)
                                .pushNamed(DataHargaTiketScreen.routeName);
                            if (data is DataHargaTiketApiData) {
                              hargaTiketController.text = "${data.hargaTiket}";
                              idHargaTiketController.text =
                                  "${data.idHargaTiket}";
                            }
                          },
                        ),
                        const SizedBox(height: 15),

                        // TextFormField(
                        //     readOnly: true,
                        //     decoration: const InputDecoration(
                        //       prefixIcon: Icon(Icons.book),
                        //       suffixIcon: Icon(Icons.keyboard_arrow_down),
                        //       labelText: 'Id Hari Operasional',
                        //     ),
                        //     controller: idHariOperasionalController,
                        //   ),
                        //   const SizedBox(height: 15),

                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Hari Operasional',
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                          ),
                          controller: hariOperasionalController,
                          onTap: () async {
                            var data = await Navigator.of(context)
                                .pushNamed(DataHariOperasionalScreen.routeName);
                            if (data is DataHariOperasionalApiData) {
                              hariOperasionalController.text =
                                  "${data.hariOperasional}";
                              idHariOperasionalController.text =
                                  "${data.idHariOperasional}";
                            }
                          },
                        ),
                        const SizedBox(height: 15),

                        // TextFormField(
                        //     readOnly: true,
                        //     decoration: const InputDecoration(
                        //       prefixIcon: Icon(Icons.book),
                        //       suffixIcon: Icon(Icons.keyboard_arrow_down),
                        //       labelText: 'Id Jam Operasional',
                        //     ),
                        //     controller: idJamOperasionalController,
                        //   ),
                        //   const SizedBox(height: 15),

                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            border: OutlineInputBorder(),
                            labelText: 'Jam Operasional',
                          ),
                          controller: jamOperasionalController,
                          onTap: () async {
                            var data = await Navigator.of(context)
                                .pushNamed(DataJamOperasionalScreen.routeName);
                            if (data is DataJamOperasionalApiData) {
                              jamOperasionalController.text =
                                  "${data.jamOperasional}";
                              idJamOperasionalController.text =
                                  "${data.idJamOperasional}";
                            }
                          },
                        ),
                        const SizedBox(height: 15),

                        const SizedBox(height: 15),
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Style.buttonBackgroundColor,
                              ),
                              onPressed: () {
                                BlocProvider.of<DataWisataSimpanBloc>(context)
                                    .add(FetchDataWisataSimpan(form));
                              },
                              child: state is DataWisataSimpanLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.save),
                                        SizedBox(width: 5),
                                        Text(
                                          "Simpan",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    idWisataController.dispose();
    namaWisataController.dispose();
    fotoController.dispose();
    deskripsiController.dispose();
    koordinatController.dispose();
    idJenisWisataController.dispose();
    jenisWisataController.dispose();
    idWilayahController.dispose();
    wilayahController.dispose();
    idRatingController.dispose();
    ratingController.dispose();
    idHargaTiketController.dispose();
    hargaTiketController.dispose();
    idHariOperasionalController.dispose();
    hariOperasionalController.dispose();
    idJamOperasionalController.dispose();
    jamOperasionalController.dispose();

    super.dispose();
  }

  void filePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) {
      if (mounted && _image == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Foto tidak ditemukan'),
        ));
      }
      return;
    }

    setState(() {
      _image = image;
    });

    debugPrint("image berhasil dipilih");

    form.fileFoto = image;
  }
}

class DataWisataTambahArguments {
  final DataWisata data;
  final String judul;

  DataWisataTambahArguments({
    required this.data,
    required this.judul,
  });
}
