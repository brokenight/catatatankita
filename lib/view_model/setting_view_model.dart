import 'package:catatankita/model/kontak.dart';
import 'package:catatankita/screens/setting_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingViewModel extends State<SettingScreen> {

  @override
  void initState() {
    getKontak();
    super.initState();
  }
  final Dio _dio = Dio();
  String? linkApk;
  String? linkGit;
  bool isLoading = true;

  Future<Kontak?> getKontak() async {
    isLoading = true;
    Kontak? kontak;
    try {
      Response kontakData = await _dio.get('https://catatankita-a86f6.web.app/kontak');
      isLoading = false;
      print('Kontak Info: ${kontakData.data}');
      kontak = Kontak.fromJson(kontakData.data);
      linkApk = kontak.linkApk;
      linkGit = kontak.git;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
      isLoading = false;
    }
    setState(() {
    });
    return kontak;
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}