import 'package:alice/alice.dart';
import 'package:app_ideas/ColorsApp.dart';
import 'package:app_ideas/constants/UrlApi.dart';
import 'package:app_ideas/controller/file_controller.dart';
import 'package:app_ideas/screens/home.dart';
import 'package:app_ideas/screens/load-page/LoadDate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartProject extends StatefulWidget {
  @override
  _StartProjectState createState() => _StartProjectState();
}

class _StartProjectState extends State<StartProject> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FileController()),
      ],
      child: MaterialApp(
      home: LoadPage(nextPage: Home(), urlRequest: UrlApi.urlBase),
      debugShowCheckedModeBanner: false,
      navigatorKey: UrlApi.alice.getNavigatorKey(),
      theme: ThemeData(
        primarySwatch: const MaterialColor(
            ColorsApp.PRIMARY_VALUE, ColorsApp.PRIMARY_ARRAY),
        primaryIconTheme: const IconThemeData(color: ColorsApp.PRIMARY),
      ),
      
    ),
    );
  }
}