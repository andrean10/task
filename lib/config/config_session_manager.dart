import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recomend_toba/login/data/login_api.dart';
import 'package:recomend_toba/login/data/login_apidata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigSessionManager {
  static ConfigSessionManager? config;

  static ConfigSessionManager getInstance() {
    config = config ?? ConfigSessionManager();
    return config!;
  }

  Future<bool> sudahLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final login = prefs.getBool("sudah_login") ?? false;
    return Future<bool>.value(login);
  }

  Future setSudahLogin(bool login) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('sudah_login', true);
  }

  Future setData(LoginApi data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('data', jsonEncode(data.result!.toJson()));
  }

  Future<LoginApiData?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("data");
    if (data != null) {
      return Future<LoginApiData>.value(
          LoginApiData.fromJson(jsonDecode(data)));
    }
    return Future.value(null);
  }

  Future<String?> getToken() async {
    var data = await getData();
    if (data != null) {
      return Future.value(data.id);
    }
    return Future.value(null);
  }

  Future<String?> getNamaPegawai() async {
    var data = await getData();
    if (data != null) {
      return Future.value(data.namaPegawai);
    }
    return Future.value(null);
  }
/*
  Future<Akses?> getAkses() async {
    var data = await getData();
    if (data != null) {
      switch (data.jabatan) {
        case 'pengawas':
          return Future<Akses>.value(Akses.pengawas);
        case 'pimpinan':
          return Future<Akses>.value(Akses.pimpinan);
        case 'transportir':
          return Future<Akses>.value(Akses.transportir);
        case 'supervisor':
          return Future<Akses>.value(Akses.supervisor);
      }
    }
    return Future.value(null);
  } */

  Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('sudah_login');
    prefs.remove('data');
  }
}
