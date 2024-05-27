import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/config/config_global.dart';
import 'package:recomend_toba/home/home_screen.dart';
import 'package:recomend_toba/login/bloc/login_bloc.dart';
import 'package:recomend_toba/login/bloc/login_event.dart';
import 'package:recomend_toba/login/bloc/login_form_bloc.dart';
import 'package:recomend_toba/login/bloc/login_form_event.dart';
import 'package:recomend_toba/login/bloc/login_state.dart';
import 'package:recomend_toba/login/data/data_login.dart';
import 'package:recomend_toba/login/login_register_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  DataLogin data = DataLogin('', '', 'alumni');
  final List<String> genderItems = [
    'alumni',
    'admin',
    'guru/karyawan',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<LoginBloc>(context),
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: ((context, state) {
          return Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // if (ConfigGlobal.register) const LoginRegisterWidget(),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: double.infinity,
                    //   child: Text(
                    //     'Silahkan login',
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    const SizedBox(height: 15),
                    TextFormField(
                      readOnly: state is LoginLoading,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        prefixIcon: const Icon(Icons.account_circle),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                        ),
                        hintText: 'Username',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username masih kosong';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          data.username = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      readOnly: state is LoginLoading,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        prefixIcon: const Icon(Icons.password),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                        ),
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password masih kosong';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          data.password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Style.buttonBackgroundColor,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginPost(data));
                                }
                              },
                              child: state is LoginLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "MASUK",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    if (state is LoginError) const Text('Login Error'),
                    if (state is LoginGagal)
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text('Login Gagal ${state.data.pesan ?? ''}'),
                      ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 15, bottom: 15),
                    //   child: Text(
                    //       "Belum memiliki akun silahkan melakukan pendaftaran"),
                    // ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       shape: const StadiumBorder(),
                    //       primary: Style.buttonBackgroundColor,
                    //     ),
                    //     onPressed: () {
                    //       BlocProvider.of<LoginFormBloc>(context)
                    //           .add(ShowRegister());
                    //     },
                    //     child: const Text(
                    //       "PENDAFTARAN",
                    //       style: TextStyle(fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
