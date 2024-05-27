import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_katalog/data_katalog_screen.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_bloc.dart';
import 'package:rxdart/rxdart.dart';

class Pencarian extends StatefulWidget {
  const Pencarian({super.key});

  @override
  State<Pencarian> createState() => _PencarianState();
}

class _PencarianState extends State<Pencarian> {
  final inputSearch = BehaviorSubject<String>();

  @override
  void initState() {
    inputSearch
        // .where((data) => data.isNotEmpty)
        .debounceTime(const Duration(milliseconds: 700))
        .listen(
      (data) {
        BlocProvider.of<DataWisataBloc>(context).add(
          FetchDataWisata(
            DataFilter(
              berdasarkan: "nama_wisata",
              isi: data,
            ),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        onTap: () {
          Navigator.of(context).pushNamed(DataKatalogScreen.routeName);
        },
        // readOnly: true,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 35,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Cari Objek Wisata',
          hintStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
        ),
        onChanged: (value) {
          inputSearch.add(value);
        },
      ),
    );
  }
}
