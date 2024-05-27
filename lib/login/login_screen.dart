import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/login/bloc/login_bloc.dart';
import 'package:recomend_toba/login/bloc/login_form_bloc.dart';
import 'package:recomend_toba/login/bloc/login_form_state.dart';
import 'package:recomend_toba/login/bloc/register_bloc.dart';
import 'package:recomend_toba/login/login_widget.dart';
import 'package:recomend_toba/login/register_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(title: const Text('Login Screen')), */
      body: MultiBlocProvider(
        providers: [
          BlocProvider<LoginFormBloc>(
            create: (BuildContext context) => LoginFormBloc(),
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),
          BlocProvider<RegisterBloc>(
            create: (BuildContext context) => RegisterBloc(),
          )
        ],
        child: Stack(children: [
          ListView(
            children: [
              Image.asset(
                "assets/background_login.png",
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  // Image.asset(
                  //   'assets/logo_full.png',
                  //   height: 150,
                  // ),
                  /* const SizedBox(height: 20), */
                  /* const Text( */
                  /*   ConfigGlobal.namaAplikasi, */
                  /*   style: TextStyle(fontSize: 20), */
                  /* ), */

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Selamat Datang  di Aplikasi Rekomendasi Objek Wisata Di Sekitar Danau Toba",
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
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

                  const SizedBox(height: 20),
                  BlocBuilder<LoginFormBloc, LoginFormState>(
                      builder: (context, state) {
                    // if (state is LoginFormLogin) return const LoginWidget();
                    if (state is LoginFormRegister) {
                      return const RegisterWidget();
                    }
                    return const LoginWidget();
                  })
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
