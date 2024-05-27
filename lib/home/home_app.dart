import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  HomeApp({super.key, required this.scaffoldKey});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Selamat Datang  di Aplikasi Rekomendasi Objek Wisata Di Sekitar Danau Toba",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Image.asset(
            //     "assets/logo_full.png",
            //     width: 250,
            //   ),
            // ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.notifications_none,
            //     color: Colors.white,
            //     size: 28,
            //   ),
            //   onPressed: () => print("notification"),
            // ),
          ],
        ),
      ],
    );
  }
}
