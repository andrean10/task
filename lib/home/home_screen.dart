import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/data_wisata/bloc/data_wisata_bloc.dart';
import 'package:recomend_toba/data_wisata/data/data_wisata_apidata.dart';
import 'package:recomend_toba/home/pencarian_wisata_screen.dart';
import 'package:recomend_toba/home/pencarian_wisata_tampil.dart';
import 'package:recomend_toba/home/home_app.dart';
import 'package:recomend_toba/home/pencarian.dart';
import 'package:recomend_toba/home/rekomendasi_wisata_screen.dart';
import 'package:recomend_toba/login/login_screen.dart';
import 'package:recomend_toba/widgets/loading_widget.dart';

import '../data_wisata/data_wisata_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLogin = true;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<DataWisataBloc>(context).add(
      const FetchDataWisata(
        DataFilter(),
      ),
    );

    ConfigSessionManager.getInstance().sudahLogin().then((value) {
      setState(() {
        isLogin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    cekLogin();
    return Scaffold(
      key: scaffoldKey,
      /* appBar: MyAppBar(), */
      drawerEnableOpenDragGesture: false,
      // drawer: const MyDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<DataWisataBloc>(context)
                .add(const FetchDataWisata(DataFilter()));
            await Future.delayed(const Duration(seconds: 3));
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Image.asset(
                      'assets/background_login.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                Column(
                  children: [
                    HomeApp(scaffoldKey: scaffoldKey),
                    const SizedBox(height: 20),
                    const Pencarian(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Builder(
                        builder: (context) {
                          final stateData =
                              context.watch<DataWisataBloc>().state;
                          if (stateData is DataWisataLoadSuccess) {
                            List<DataWisataApiData> data =
                                stateData.data.result;
                            if (data.isEmpty) {
                              return NoInternetWidget(
                                pesan: "Maaf, data masih kosong!",
                              );
                            }
                            return LayoutGrid(
                              columnSizes: [1.fr, 1.fr],
                              rowSizes:
                                  List.generate(data.length, (index) => auto),
                              rowGap: 3,
                              columnGap: 3,
                              children: [
                                for (var i = 0; i < data.length; i++)
                                  DataWisataTampil(
                                    data: data[i],
                                    onTapHapus: (value) async {},
                                    onTapEdit: (value) async {},
                                  ),
                              ],
                            );
                          }
                          if (stateData is DataWisataLoading) {
                            return LinearProgressIndicator();
                          }
                          if (stateData is DataWisataLoadFailure) {
                            return NoInternetWidget(pesan: stateData.pesan);
                          }
                          return NoInternetWidget();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: isLogin
          ? Padding(
        padding: const EdgeInsets.only(bottom: 60.0), // Sesuaikan dengan posisi yang diinginkan
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(DataWisataScreen.routeName);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue, // Sesuaikan dengan warna yang diinginkan
        ),
      )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.umbrella_rounded),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Pencarian',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_rounded),
            label: 'Rekomendasi',
          ),
          BottomNavigationBarItem(
            icon: isLogin ? Icon(Icons.logout_rounded) : Icon(Icons.login_rounded),
            label: isLogin ? 'Logout' : 'Login Admin',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Style.buttonBackgroundColor,
        onTap: ((value) async {
          if (value == 0) {
            BlocProvider.of<DataWisataBloc>(context)
                .add(const FetchDataWisata(DataFilter()));
          }
          if (value == 1) {
            Navigator.of(context).pushNamed(PencarianWisataScreen.routeName);
            return;
          }
          if (value == 2) {
            Navigator.of(context).pushNamed(RekomendasiWisataScreen.routeName);
            return;
          }
          if (value == 3) {
            if (isLogin) {
              await ConfigSessionManager.getInstance().logout();
              if (mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeScreen.routeName,
                      (Route<dynamic> route) => false,
                );
              }
            } else {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            }
            return;
          }
        }),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  void cekLogin() async {
    // if (!ConfigGlobal.login) return;
    // final session = ConfigSessionManager.getInstance();
    // final sudahLogin = await session.sudahLogin();
    // if (sudahLogin) return;
    // if (!mounted) return;
    // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}

const double baseHeight = 650.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}
