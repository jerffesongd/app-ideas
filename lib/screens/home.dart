import 'package:app_ideas/constants/UrlApi.dart';
import 'package:app_ideas/controller/file_controller.dart';
import 'package:app_ideas/domain/file.dart';
import 'package:app_ideas/screens/load-page/LoadDate.dart';
import 'package:app_ideas/screens/see-idea/see_idea.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  File _file;
  String backUrl;

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
            title: Text("Ideias"),
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoadPage(
                              nextPage: Home(), urlRequest: getBackUrl())),
                    ))),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: pastas(),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> pastas() {
    _file = Provider.of<FileController>(context).getFile();
    List<Widget> pastas = List();

    if (_file.tree != null) {
      for (File file in _file.tree) {
        pastas.add(ListTile(
          title: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: showIcon(file),
                ),
                Expanded(
                  child: AutoSizeText(
                    file.name,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadPage(
                        nextPage: showNextPage(file), urlRequest: file.url)))
          },
        ));
      }
    }

    return pastas;
  }

  showNextPage(File file) {
    if (file.type == "tree") {
      return Home();
    } else {
      return SeeIdea(file: file);
    }
  }

  showIcon(File file) {
    if (file.type == "tree") {
      return Image.asset(
        "assets/img/folder.png",
        width: 50,
      );
    } else {
      return Image.asset(
        "assets/img/book.png",
        width: 50,
      );
    }
  }

  String getBackUrl() {
    return Provider.of<FileController>(context).getBackUrl();
  }
}
