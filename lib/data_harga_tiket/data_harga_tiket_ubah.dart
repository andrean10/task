import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_harga_tiket/bloc/data_harga_tiket_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/bloc/data_harga_tiket_ubah_bloc.dart';
import 'package:recomend_toba/data_harga_tiket/data/data_harga_tiket.dart';

class DataHargaTiketUbahScreen extends StatefulWidget {
  static const routeName = "data_harga_tiket/edit";
  const DataHargaTiketUbahScreen({super.key});

  @override
  State<DataHargaTiketUbahScreen> createState() =>
      _DataHargaTiketUbahScreenState();
}

class _DataHargaTiketUbahScreenState extends State<DataHargaTiketUbahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataHargaTiketUbahArguments? screenArgument;

  DataHargaTiket form = DataHargaTiket();

  var idHargaTiketController = TextEditingController();
  var hargaTiketController = TextEditingController();
  var nilaiController = TextEditingController();

  @override
  void initState() {
    super.initState();

    idHargaTiketController.addListener(() {
      form.idHargaTiket = idHargaTiketController.text;
    });

    hargaTiketController.addListener(() {
      form.hargaTiket = hargaTiketController.text;
    });

    nilaiController.addListener(() {
      form.nilai = nilaiController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataHargaTiketUbahArguments;

      if (screenArgument != null) {
        idHargaTiketController.text = screenArgument?.data.idHargaTiket ?? "";
        hargaTiketController.text = screenArgument?.data.hargaTiket ?? "";
        nilaiController.text = screenArgument?.data.nilai ?? "";
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments
        as DataHargaTiketUbahArguments;

    /*
    idProgramHafalanController.text = args.data.idProgramHafalan ?? "";
    tanggalController.text = args.data.tanggal ?? "";
    hapalanController.text = args.data.hapalan ?? "";
    keteranganController.text = args.data.keterangan ?? "";
    */

    return BlocListener(
      bloc: BlocProvider.of<DataHargaTiketUbahBloc>(context),
      listener: ((context, state) {
        if (state is DataHargaTiketUbahLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil diubah'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is DataHargaTiketUbahLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal diubah'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<DataHargaTiketUbahBloc, DataHargaTiketUbahState>(
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
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          // const LoginDataHargaTiketScreen(),
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
                              labelText: 'Id Harga Tiket',
                            ),
                            controller: idHargaTiketController,
                          ),
                          const SizedBox(height: 15),

                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.book),
                              border: OutlineInputBorder(),
                              labelText: 'Harga Tiket',
                            ),
                            controller: hargaTiketController,
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

                          SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  primary: Style.buttonBackgroundColor,
                                ),
                                onPressed: () {
                                  BlocProvider.of<DataHargaTiketUbahBloc>(
                                          context)
                                      .add(FetchDataHargaTiketUbah(form));
                                },
                                child: state is DataHargaTiketUbahLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.save),
                                          SizedBox(width: 5),
                                          Text(
                                            "Ubah",
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
              ));
        },
      ),
    );
  }

  @override
  void dispose() {
    idHargaTiketController.dispose();
    hargaTiketController.dispose();
    nilaiController.dispose();

    super.dispose();
  }
}

class DataHargaTiketUbahArguments {
  final DataHargaTiket data;
  final String judul;

  DataHargaTiketUbahArguments({
    required this.data,
    required this.judul,
  });
}
