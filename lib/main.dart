import 'package:app_ideas/constants/UrlApi.dart';
import 'package:app_ideas/controller/file_controller.dart';
import 'package:app_ideas/screens/home.dart';
import 'package:app_ideas/screens/load-page/LoadDate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ColorsApp.dart';

void main() => runApp(

  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FileController()),
      ],
      child: MaterialApp(
      home: LoadPage(nextPage: Home(),urlRequest: UrlApi.urlBase, backUrl: UrlApi.urlBase,),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
            ColorsApp.PRIMARY_VALUE, ColorsApp.PRIMARY_ARRAY),
        primaryIconTheme: const IconThemeData(color: ColorsApp.PRIMARY),
      ),
      
    ),
    ),

  
);

