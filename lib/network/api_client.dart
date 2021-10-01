import 'package:catatankita/model/kontak.dart';
import 'package:dio/dio.dart';

class ApiClient{
  final Dio _dio = Dio();
  final _baseUrl = 'https://catatankita-a86f6.web.app/';
}