import 'package:app_ideas/ColorsApp.dart';
import 'package:flutter/material.dart';

class ScreenLoadPage extends StatefulWidget {

  final String message;

  final Widget icone;
  
  ScreenLoadPage({Key key, this.message = "Carregando Informações...", this.icone = const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.PRIMARY))})
      : super(key: key);

  @override
  _ScreenLoadPageState createState() => _ScreenLoadPageState();
}

class _ScreenLoadPageState extends State<ScreenLoadPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.icone,
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  widget.message,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: ColorsApp.PRIMARY,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}