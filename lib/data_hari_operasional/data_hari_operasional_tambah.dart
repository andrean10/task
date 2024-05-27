import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_hari_operasional/bloc/data_hari_operasional_simpan_bloc.dart';
import 'package:recomend_toba/data_hari_operasional/data/data_hari_operasional.dart';

class DataHariOperasionalTambahScreen extends StatefulWidget {
  static const routeName = "data_hari_operasional/tambah";
  const DataHariOperasionalTambahScreen({super.key});

  @override
  State<DataHariOperasionalTambahScreen> createState() =>
      _DataHariOperasionalTambahScreenState();
}

class _DataHariOperasionalTambahScreenState
    extends State<DataHariOperasionalTambahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataHariOperasionalTambahArguments? screenArgument;

  DataHariOperasional form = DataHariOperasional();

  var idHariOperasionalController = TextEditingController();
  var hariOperasionalController = TextEditingController();
  var nilaiController = TextEditingController();

  @override
  void initState() {
    super.initState();

    idHariOperasionalController.addListener(() {
      form.idHariOperasional = idHariOperasionalController.text;
    });

    hariOperasionalController.addListener(() {
      form.hariOperasional = hariOperasionalController.text;
    });

    nilaiController.addListener(() {
      form.nilai = nilaiController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataHariOperasionalTambahArguments;

      if (screenArgument != null) {}

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<DataHariOperasionalSimpanBloc>(context),
      listener: ((context, state) {
        if (state is DataHariOperasionalSimpanLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
        if (state is DataHariOperasionalSimpanLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<DataHariOperasionalSimpanBloc,
          DataHariOperasionalSimpanState>(
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
                        // const LoginDataHariOperasionalScreen(),
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
                            labelText: 'Id Hari Operasional',
                          ),
                          controller: idHariOperasionalController,
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            border: OutlineInputBorder(),
                            labelText: 'Hari Operasional',
                          ),
                          controller: hariOperasionalController,
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
                                BlocProvider.of<DataHariOperasionalSimpanBloc>(
                                        context)
                                    .add(FetchDataHariOperasionalSimpan(form));
                              },
                              child: state is DataHariOperasionalSimpanLoading
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
    idHariOperasionalController.dispose();
    hariOperasionalController.dispose();
    nilaiController.dispose();

    super.dispose();
  }
}

class DataHariOperasionalTambahArguments {
  final DataHariOperasional data;
  final String judul;

  DataHariOperasionalTambahArguments({
    required this.data,
    required this.judul,
  });
}
