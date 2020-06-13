import 'dart:async';

import 'package:alice/alice.dart';
import 'package:app_ideas/constants/UrlApi.dart';
import 'package:app_ideas/constants/github.dart';
import 'package:app_ideas/domain/file.dart';
import 'package:app_ideas/exception/ComunicacaoApiException.dart';
import 'package:app_ideas/exception/ErrorApi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FileController with ChangeNotifier {

  File _files;
  int _statusCode;
  ErrorApi _erro;
  var _backUrl = [];

  Future<Null> carregarIdeias(String urlRequest) async {

    try {

      var dio = Dio();
      dio.interceptors.add(UrlApi.alice.getDioInterceptor());
      if (urlRequest == null) {
        urlRequest = UrlApi.urlBase;
      }
      _backUrl.add(urlRequest);
      Map<String, String> header = {'Accept': 'application/vnd.github.v3+json', 'jerffesongd':GitHub.token};

      Response response = await dio.get(urlRequest, options: Options(headers: header)).timeout(Duration(seconds: 60));
      _statusCode = response.statusCode;

      if (_statusCode == 200 ) {
        
        _files = File.fromJson(response.data);   
        notifyListeners();

      } else {
          _erro = ErrorApi(response.statusCode, response.statusMessage, response.data, response.realUri.origin );
          throw ComunicacaoApiException.withErroIcon(_erro, (Icon(Icons.vpn_key, color: Colors.red)));
      }
      
    } on TimeoutException catch (ti) {
      print("Erro: $ti.message");
      throw ComunicacaoApiException.withMessageIcon("Não foi possível se comunicar com o servidor", (Icon(Icons.access_time, color: Colors.red)));
    }

  }


  File getFile () {
    return _files;
  }

  String getBackUrl() {
  
    if (_backUrl.length > 1) {
      _backUrl.removeLast();
       return _backUrl.removeLast();
    } else {
      return _backUrl.removeLast();
    }
    
  }

  int getStatusCode() => _statusCode;

  ErrorApi getError() => _erro;
}