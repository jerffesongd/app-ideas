import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:app_ideas/controller/file_controller.dart';
import 'package:app_ideas/domain/file.dart';
import 'package:app_ideas/screens/home.dart';
import 'package:app_ideas/screens/load-page/LoadDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class SeeIdea extends StatefulWidget {

  final File file;

  SeeIdea({@required this.file});

  @override
  _SeeIdeaState createState() => _SeeIdeaState();
}

class _SeeIdeaState extends State<SeeIdea> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ideia"),
        automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadPage(
                        nextPage: Home(), urlRequest: getBackUrl()))),
            )
      ),
      body: SafeArea(
        child: Markdown(
          data: getContentFile())
        )
    );
  }

  String getContentFile() {

    File _file = Provider.of<FileController>(context).getFile();
    var codec = latin1.fuse(base64);
    var stringBase64 = _file.content;
    String textoComleto = "";

    if(stringBase64 != null) {
      for (String texto in stringBase64.split("\n")) {
        textoComleto += codec.decode(texto);
      }
    }

    return textoComleto;
  }

  String getBackUrl() {
    return Provider.of<FileController>(context).getBackUrl();
  }

}
