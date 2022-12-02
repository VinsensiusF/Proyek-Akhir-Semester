import 'package:flutter/material.dart';
import 'package:pas/pages/daftar_proyek_page.dart';
import 'package:pas/utils/utils.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Application name
  static final String title = 'Project Channel';


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
      // Application theme data, you can set the colors for 
      // the application as you want
      theme: ThemeData(primarySwatch: Colors.blue),
      // A widget which will be started on application startup
      home: DaftarProyekPage()
      )
    );
  }
}