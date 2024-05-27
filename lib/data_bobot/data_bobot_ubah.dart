import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_bobot/bloc/data_bobot_bloc.dart';
import 'package:recomend_toba/data_bobot/bloc/data_bobot_ubah_bloc.dart';
import 'package:recomend_toba/data_bobot/data/data_bobot.dart';

class DataBobotUbahScreen extends StatefulWidget {
  static const routeName = "data_bobot/edit";
  const DataBobotUbahScreen({super.key});

  @override
  State<DataBobotUbahScreen> createState() => _DataBobotUbahScreenState();
}

class _DataBobotUbahScreenState extends State<DataBobotUbahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataBobotUbahArguments? screenArgument;

  DataBobot form = DataBobot();

  var idBobotController = TextEditingController();
  var jenisWisataController = TextEditingController();
  var wilayahController = TextEditingController();
  var ratingController = TextEditingController();
  var hargaTiketController = TextEditingController();
  var hariOperasionalController = TextEditingController();
  var jamOperasionalController = TextEditingController();

  @override
  void initState() {
    super.initState();

    idBobotController.addListener(() {
      form.idBobot = idBobotController.text;
    });

    jenisWisataController.addListener(() {
      form.jenisWisata = jenisWisataController.text;
    });

    wilayahController.addListener(() {
      form.wilayah = wilayahController.text;
    });

    ratingController.addListener(() {
      form.rating = ratingController.text;
    });

    hargaTiketController.addListener(() {
      form.hargaTiket = hargaTiketController.text;
    });

    hariOperasionalController.addListener(() {
      form.hariOperasional = hariOperasionalController.text;
    });

    jamOperasionalController.addListener(() {
      form.jamOperasional = jamOperasionalController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument =
          ModalRoute.of(context)!.settings.arguments as DataBobotUbahArguments;

      if (screenArgument != null) {
        idBobotController.text = screenArgument?.data.idBobot ?? "";
        jenisWisataController.text = screenArgument?.data.jenisWisata ?? "";
        wilayahController.text = screenArgument?.data.wilayah ?? "";
        ratingController.text = screenArgument?.data.rating ?? "";
        hargaTiketController.text = screenArgument?.data.hargaTiket ?? "";
        hariOperasionalController.text =
            screenArgument?.data.hariOperasional ?? "";
        jamOperasionalController.text =
            screenArgument?.data.jamOperasional ?? "";
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as DataBobotUbahArguments;

    /*
    idProgramHafalanController.text = args.data.idProgramHafalan ?? "";
    tanggalController.text = args.data.tanggal ?? "";
    hapalanController.text = args.data.hapalan ?? "";
    keteranganController.text = args.data.keterangan ?? "";
    */

    return BlocListener(
      bloc: BlocProvider.of<DataBobotUbahBloc>(context),
      listener: ((context, state) {
        if (state is DataBobotUbahLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil diubah'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is DataBobotUbahLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal diubah'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<DataBobotUbahBloc, DataBobotUbahState>(
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
                          // const LoginDataBobotScreen(),
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
                              labelText: 'Id Bobot',
                            ),
                            controller: idBobotController,
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
                              labelText: 'Wilayah',
                            ),
                            controller: wilayahController,
                          ),
                          const SizedBox(height: 15),

                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.book),
                              border: OutlineInputBorder(),
                              labelText: 'Rating',
                            ),
                            controller: ratingController,
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
                              labelText: 'Hari Operasional',
                            ),
                            controller: hariOperasionalController,
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

                          SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  primary: Style.buttonBackgroundColor,
                                ),
                                onPressed: () {
                                  BlocProvider.of<DataBobotUbahBloc>(context)
                                      .add(FetchDataBobotUbah(form));
                                },
                                child: state is DataBobotUbahLoading
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
    idBobotController.dispose();
    jenisWisataController.dispose();
    wilayahController.dispose();
    ratingController.dispose();
    hargaTiketController.dispose();
    hariOperasionalController.dispose();
    jamOperasionalController.dispose();

    super.dispose();
  }
}

class DataBobotUbahArguments {
  final DataBobot data;
  final String judul;

  DataBobotUbahArguments({
    required this.data,
    required this.judul,
  });
}
