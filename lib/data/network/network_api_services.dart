import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mvvm_example/data/app_exceptions.dart';
import 'package:mvvm_example/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiSerivices extends BaseApiServices {
  // function untuk mengambil data dari api
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // artinya internetnya mengalami ganguan
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  // function untuk mengirim data menggunakan metode post ke api
  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              // body: jsonEncode(data)
              body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // artinya internetnya mengalami ganguan
      throw InternetException("");
      // "Request timeout" atau "timeout permintaan" adalah kondisi yang terjadi ketika suatu permintaan (request) yang dikirim ke server atau sumber data lainnya tidak mendapatkan respons dalam batas waktu tertentu yang telah ditentukan
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  /// Menghandle response atau pesan ketika setelah proses network api (get, post, delete, put)
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException;
      default:
        throw FetchDataException(
            "Error accoured while communicating with server ${response.statusCode.toString()}");
    }
  }
}
