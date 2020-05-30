import 'dart:async';

import 'package:app_ideas/domain/project.dart';
import 'package:app_ideas/exception/ComunicacaoApiException.dart';
import 'package:app_ideas/exception/ErrorApi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FolderController with ChangeNotifier {

  Project _project;
  int _statusCode;
  ErrorApi _erro;

  Future<Null> carregarIdeias(String urlRequest) async {

    try {

      String _url = urlRequest;
      var dio = Dio();

      Response response = await dio.get(_url).timeout(Duration(seconds: 60));
      _statusCode = response.statusCode;

      if (_statusCode == 200 ) {
        
        _project = Project.fromJson(response.data);   
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


  Project getProject () {
    return _project;
  }

  int getStatusCode() => _statusCode;

  ErrorApi getError() => _erro;
}