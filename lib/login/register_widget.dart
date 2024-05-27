import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recomend_toba/config/color.dart';
import 'package:recomend_toba/enum/enum_widget.dart';
import 'package:recomend_toba/enum/repo/enum_remote.dart';
import 'package:recomend_toba/login/bloc/login_form_bloc.dart';
import 'package:recomend_toba/login/bloc/login_form_event.dart';
import 'package:intl/intl.dart';
import 'package:recomend_toba/login/bloc/register_bloc.dart';
import 'package:recomend_toba/login/bloc/register_event.dart';
import 'package:recomend_toba/login/bloc/register_state.dart';
import 'package:recomend_toba/login/data/data_register.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  EnumRemote enumRemote = EnumRemote();

  DataRegister form = DataRegister();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<RegisterBloc>(context),
      listener: ((context, state) {
        if (state is RegisterSuccess) {
          // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          BlocProvider.of<LoginFormBloc>(context).add(ShowLogin());
          const snackBar = SnackBar(
            content: Text('Registrasi berhasil, silahkan login!'),
          );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Form(
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    // const LoginRegisterWidget(),
                    const Padding(
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
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Silahkan lengkapi form pendaftaran',
                        textAlign: TextAlign.left,
                      ),
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
                          BlocProvider.of<LoginFormBloc>(context)
                              .add(ShowLogin());
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
