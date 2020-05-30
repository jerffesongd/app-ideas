import 'package:after_layout/after_layout.dart';
import 'package:app_ideas/ColorsApp.dart';
import 'package:app_ideas/controller/FolderController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'ScreenLoadPage.dart';

class LoadPage extends StatefulWidget {

  final Widget nextPage;
  final String urlRequest;

  @override
  _LoadPageState createState() => _LoadPageState();

  LoadPage({Key key, @required this.nextPage, @required this.urlRequest});

}

class _LoadPageState extends State<LoadPage> with AfterLayoutMixin<LoadPage> {
  String _mensagem = "Carregando Informações...";
  Widget _icone = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.PRIMARY));

  @override
  void initState() {
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    
    try { 

      await _carregarIdeias();

    } catch (e) {
      print (e);
      updateMessageIcone(
          "Erro Interno :(", (Icon(Icons.error, color: Colors.red)));
    }
    
  }

  Future<Null> _carregarIdeias() async {

    await Provider.of<FolderController>(context, listen: false).carregarIdeias(widget.urlRequest);
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget.nextPage));


  }

  updateMessageIcone(String novaMensagem, Widget novoIcone) {
    if (this.mounted){
      setState(() {
        _mensagem = novaMensagem;
        _icone = novoIcone;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLoadPage(
      message: _mensagem,
      icone: _icone,
    );
  }
}
