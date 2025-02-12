// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:fixit/Constant/url.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:fixit/Controller/ServicesProvider.dart';

enum RequestType { GET, POST, PUT, DELETE }

enum RequestTypeImage { POST_WITH_IMAGE, POST_WITH_MULTI_IMAGE }

class NetworkClient {
  static final String _baseUrl = AppApi.url;

  final Client _client;

  NetworkClient(this._client);
  Future<StreamedResponse> requestwithfile({
    required String path,
    Map<String, String>? body,
    http.MultipartFile? file,
  }) async {
    var req = http.MultipartRequest(
      "POST",
      Uri.parse('$_baseUrl$path'),
    )
      ..fields.addAll(body!)
      ..files.add(file!)
      ..headers.addAll(
        {
          "Accept": "application/json",
          'Authorization': 'Bearer ${ServicesProvider.getToken()}'
        },
      );
    var res = await req.send();
    return res;
  }

  Future<StreamedResponse> requestwithMultifile({
    required String path,
    Map<String, String>? body,
    List<http.MultipartFile>? files,
  }) async {
    var req = http.MultipartRequest(
      "POST",
      Uri.parse('$_baseUrl$path'),
    )
      ..fields.addAll(body!)
      ..files.addAll(files!)
      ..headers.addAll(
        {
          "Accept": "application/json",
          'Authorization': 'Bearer ${ServicesProvider.getToken()}'
        },
      );
    var res = await req.send();
    return res;
  }

  Future<Response> request(
      {required RequestType requestType,
      required String path,
      String? body,
      int TimeOut = 30}) async {
    log("$_baseUrl$path");
    log(ServicesProvider.getToken());

    switch (requestType) {
      case RequestType.GET:
        return _client.get(Uri.parse("$_baseUrl$path"), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ServicesProvider.getToken()}'
        }).timeout(Duration(seconds: TimeOut));
      case RequestType.POST:
        return _client
            .post(Uri.parse("$_baseUrl$path"),
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer ${ServicesProvider.getToken()}'
                },
                body: body)
            .timeout(Duration(seconds: TimeOut));
      case RequestType.PUT:
        return _client
            .put(Uri.parse("$_baseUrl$path"),
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer ${ServicesProvider.getToken()}'
                },
                body: body)
            .timeout(Duration(seconds: TimeOut));
      case RequestType.DELETE:
        return _client
            .delete(Uri.parse("$_baseUrl$path"),
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer ${ServicesProvider.getToken()}'
                },
                body: body)
            .timeout(Duration(seconds: TimeOut));
    }
  }
}
