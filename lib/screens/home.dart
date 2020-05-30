import 'dart:convert';

import 'package:app_ideas/controller/FolderController.dart';
import 'package:app_ideas/domain/folder.dart';
import 'package:app_ideas/domain/project.dart';
import 'package:app_ideas/screens/load-page/LoadDate.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Project project;

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

  List<Widget> pastas() {
    
    project = Provider.of<FolderController>(context).getProject();
    List<Widget> pastas = List();

    for (Folder folder in project.tree) {
      pastas.add(ListTile(
        title: Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/img/folder.png",
                  width: 50,
                ),
              ),
              Expanded(
                  child: AutoSizeText(
                  folder.name,
                  style: TextStyle(fontSize: 20),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoadPage(nextPage: Home(), urlRequest: folder.url)))
        },
      ));
    }

    return pastas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ideas"),
      ),
      body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: pastas(),
                  ),
                )
              ],
            ),
        )
    );
  }
}
