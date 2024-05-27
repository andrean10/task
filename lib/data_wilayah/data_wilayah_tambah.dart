import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_wilayah/bloc/data_wilayah_simpan_bloc.dart';
import 'package:recomend_toba/data_wilayah/data/data_wilayah.dart';

class DataWilayahTambahScreen extends StatefulWidget {
  static const routeName = "data_wilayah/tambah";
  const DataWilayahTambahScreen({super.key});

  @override
  State<DataWilayahTambahScreen> createState() =>
      _DataWilayahTambahScreenState();
}

class _DataWilayahTambahScreenState extends State<DataWilayahTambahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataWilayahTambahArguments? screenArgument;

  DataWilayah form = DataWilayah();

  var idWilayahController = TextEditingController();
  var wilayahController = TextEditingController();
  var nilaiController = TextEditingController();

  @override
  void initState() {
    super.initState();

    idWilayahController.addListener(() {
      form.idWilayah = idWilayahController.text;
    });

    wilayahController.addListener(() {
      form.wilayah = wilayahController.text;
    });

    nilaiController.addListener(() {
      form.nilai = nilaiController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataWilayahTambahArguments;

      if (screenArgument != null) {}

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<DataWilayahSimpanBloc>(context),
      listener: ((context, state) {
        if (state is DataWilayahSimpanLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
        if (state is DataWilayahSimpanLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<DataWilayahSimpanBloc, DataWilayahSimpanState>(
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
                        // const LoginDataWilayahScreen(),
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
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Silahkan lengkapi form',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Id Wilayah',
                          ),
                          controller: idWilayahController,
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Wilayah',
                          ),
                          controller: wilayahController,
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Nilai',
                          ),
                          controller: nilaiController,
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
                                BlocProvider.of<DataWilayahSimpanBloc>(context)
                                    .add(FetchDataWilayahSimpan(form));
                              },
                              child: state is DataWilayahSimpanLoading
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
    idWilayahController.dispose();
    wilayahController.dispose();
    nilaiController.dispose();

    super.dispose();
  }
}

class DataWilayahTambahArguments {
  final DataWilayah data;
  final String judul;

  DataWilayahTambahArguments({
    required this.data,
    required this.judul,
  });
}
