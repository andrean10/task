import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/data_rating/bloc/data_rating_simpan_bloc.dart';
import 'package:recomend_toba/data_rating/data/data_rating.dart';

class DataRatingTambahScreen extends StatefulWidget {
  static const routeName = "data_rating/tambah";
  const DataRatingTambahScreen({super.key});

  @override
  State<DataRatingTambahScreen> createState() => _DataRatingTambahScreenState();
}

class _DataRatingTambahScreenState extends State<DataRatingTambahScreen> {
  EnumRemote enumRemote = EnumRemote();

  DataRatingTambahArguments? screenArgument;

  DataRating form = DataRating();

  var idRatingController = TextEditingController();
  var ratingController = TextEditingController();
  var nilaiController = TextEditingController();

  @override
  void initState() {
    super.initState();

    idRatingController.addListener(() {
      form.idRating = idRatingController.text;
    });

    ratingController.addListener(() {
      form.rating = ratingController.text;
    });

    nilaiController.addListener(() {
      form.nilai = nilaiController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenArgument = ModalRoute.of(context)!.settings.arguments
          as DataRatingTambahArguments;

      if (screenArgument != null) {}

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<DataRatingSimpanBloc>(context),
      listener: ((context, state) {
        if (state is DataRatingSimpanLoadSuccess) {
          const snackBar = SnackBar(
            content: Text('Data berhasil disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
        if (state is DataRatingSimpanLoadFailure) {
          const snackBar = SnackBar(
            content: Text('Data gagal disimpan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<DataRatingSimpanBloc, DataRatingSimpanState>(
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
                        // const LoginDataRatingScreen(),
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
                            labelText: 'Id Rating',
                          ),
                          controller: idRatingController,
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
                                BlocProvider.of<DataRatingSimpanBloc>(context)
                                    .add(FetchDataRatingSimpan(form));
                              },
                              child: state is DataRatingSimpanLoading
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
    idRatingController.dispose();
    ratingController.dispose();
    nilaiController.dispose();

    super.dispose();
  }
}

class DataRatingTambahArguments {
  final DataRating data;
  final String judul;

  DataRatingTambahArguments({
    required this.data,
    required this.judul,
  });
}
