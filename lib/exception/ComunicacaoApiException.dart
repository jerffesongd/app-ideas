import 'package:app_ideas/exception/ErrorApi.dart';
import 'package:flutter/cupertino.dart';

class ComunicacaoApiException implements Exception {
  
  String causa;
  ErrorApi erroApi;
  Widget icon;

  ComunicacaoApiException(this.causa);
  
  ComunicacaoApiException.fromErroApi(this.erroApi);

  ComunicacaoApiException.withErroIcon(this.erroApi, this.icon);

  ComunicacaoApiException.withMessageIcon(this.causa, this.icon);
  
  @override
  String toString() {
    return causa;
  }

}