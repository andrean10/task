import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/config/config_session_manager.dart';
import 'package:recomend_toba/data/data_filter.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/login/data/login_apidata.dart';
import 'package:recomend_toba/login/login_screen.dart';

class ProfilScreen extends StatefulWidget {
  static const routeName = "profil";

  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  LoginApiData? data;
  EnumRemote enumRemote = EnumRemote();

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    var data = await ConfigSessionManager.getInstance().getData();
    if (data != null) {
      setState(() {
        this.data = data;
      });
      return;
    }
    await ConfigSessionManager.getInstance().setSudahLogin(false);
    if (mounted) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
          IconButton(
              onPressed: () async {
                await ConfigSessionManager.getInstance().logout();
                if (mounted) {
                  Navigator.pushNamedAndRemoveUntil(context,
                      LoginScreen.routeName, (Route<dynamic> route) => false);
                }
              },
              icon: const Icon(Icons.power_settings_new)),
        ],
      ),
      body: data == null
          ? Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(3),
              child: const Center(child: CircularProgressIndicator()),
            )
          : Stack(children: [
              SingleChildScrollView(
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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              Image.asset("assets/logo.png", height: 80),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
