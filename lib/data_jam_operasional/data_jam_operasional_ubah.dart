import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_jam_operasional/bloc/data_jam_operasional_bloc.dart';
import 'package:recomend_toba/data_jam_operasional/bloc/data_jam_operasional_ubah_bloc.dart';
import 'package:recomend_toba/data_jam_operasional/data/data_jam_operasional.dart';

class DataJamOperasionalUbahScreen extends StatefulWidget {
  static const routeName = "data_jam_operasional/edit";
  const DataJamOperasionalUbahScreen({super.key});

  @override
  State<DataJamOperasionalUbahScreen> createState() =>
      _DataJamOperasionalUbahScreenState();
}

class _DataJamOperasionalUbahScreenState
    extends State<DataJamOperasionalUbahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataJamOperasionalUbahArguments? screenArgument;

  DataJamOperasional form = DataJamOperasional();

  var idJamOperasionalController = TextEditingController();
  var jamOperasionalController = TextEditingController();
  var nilaiController = TextEditingController();

  @override
  void initState() {
    super.initState();

    idJamOperasionalController.addListener(() {
      form.idJamOperasional = idJamOperasionalController.text;
    });

    jamOperasionalController.addListener(() {
      form.jamOperasional = jamOperasionalController.text;
    });

    nilaiController.addListener(() {
      form.nilai = nilaiController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataJamOperasionalUbahArguments;

      if (screenArgument != null) {
        idJamOperasionalController.text =
            screenArgument?.data.idJamOperasional ?? "";
        jamOperasionalController.text =
            screenArgument?.data.jamOperasional ?? "";
        nilaiController.text = screenArgument?.data.nilai ?? "";
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments
        as DataJamOperasionalUbahArguments;

    /*
    idProgramHafalanController.text = args.data.idProgramHafalan ?? "";
    tanggalController.text = args.data.tanggal ?? "";
    hapalanController.text = args.data.hapalan ?? "";
    keteranganController.text = args.data.keterangan ?? "";
    */

    return BlocListener(
      bloc: BlocProvider.of<DataJamOperasionalUbahBloc>(context),
      listener: ((context, state) {
        if (state is DataJamOperasionalUbahLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil diubah'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is DataJamOperasionalUbahLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal diubah'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child:
          BlocBuilder<DataJamOperasionalUbahBloc, DataJamOperasionalUbahState>(
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
                          // const LoginDataJamOperasionalScreen(),
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
                              labelText: 'Id Jam Operasional',
                            ),
                            controller: idJamOperasionalController,
                          ),
                          const SizedBox(height: 15),

                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.book),
                              border: OutlineInputBorder(),
                              labelText: 'Jam Operasional',
                            ),
                            controller: jamOperasionalController,
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
                                  BlocProvider.of<DataJamOperasionalUbahBloc>(
                                          context)
                                      .add(FetchDataJamOperasionalUbah(form));
                                },
                                child: state is DataJamOperasionalUbahLoading
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
    idJamOperasionalController.dispose();
    jamOperasionalController.dispose();
    nilaiController.dispose();

    super.dispose();
  }
}

class DataJamOperasionalUbahArguments {
  final DataJamOperasional data;
  final String judul;

  DataJamOperasionalUbahArguments({
    required this.data,
    required this.judul,
  });
}
