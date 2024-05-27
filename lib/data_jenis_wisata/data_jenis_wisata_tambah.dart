import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_jenis_wisata/bloc/data_jenis_wisata_simpan_bloc.dart';
import 'package:recomend_toba/data_jenis_wisata/data/data_jenis_wisata.dart';

class DataJenisWisataTambahScreen extends StatefulWidget {
  static const routeName = "data_jenis_wisata/tambah";
  const DataJenisWisataTambahScreen({super.key});

  @override
  State<DataJenisWisataTambahScreen> createState() =>
      _DataJenisWisataTambahScreenState();
}

class _DataJenisWisataTambahScreenState
    extends State<DataJenisWisataTambahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataJenisWisataTambahArguments? screenArgument;

  DataJenisWisata form = DataJenisWisata();

  var idJenisWisataController = TextEditingController();
  var jenisWisataController = TextEditingController();
  var nilaiController = TextEditingController();

  @override
  void initState() {
    super.initState();

    idJenisWisataController.addListener(() {
      form.idJenisWisata = idJenisWisataController.text;
    });

    jenisWisataController.addListener(() {
      form.jenisWisata = jenisWisataController.text;
    });

    nilaiController.addListener(() {
      form.nilai = nilaiController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataJenisWisataTambahArguments;

      if (screenArgument != null) {}

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<DataJenisWisataSimpanBloc>(context),
      listener: ((context, state) {
        if (state is DataJenisWisataSimpanLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
        if (state is DataJenisWisataSimpanLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<DataJenisWisataSimpanBloc, DataJenisWisataSimpanState>(
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
                        // const LoginDataJenisWisataScreen(),
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
                            labelText: 'Id Jenis Wisata',
                          ),
                          controller: idJenisWisataController,
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Jenis Wisata',
                          ),
                          controller: jenisWisataController,
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
                                BlocProvider.of<DataJenisWisataSimpanBloc>(
                                        context)
                                    .add(FetchDataJenisWisataSimpan(form));
                              },
                              child: state is DataJenisWisataSimpanLoading
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
    idJenisWisataController.dispose();
    jenisWisataController.dispose();
    nilaiController.dispose();

    super.dispose();
  }
}

class DataJenisWisataTambahArguments {
  final DataJenisWisata data;
  final String judul;

  DataJenisWisataTambahArguments({
    required this.data,
    required this.judul,
  });
}
