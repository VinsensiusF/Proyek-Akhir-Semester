import 'package:flutter/cupertino.dart';
import 'package:pas/models/faq_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pas/pages/login_page.dart';

Future<List<FaqModel>> fetchFAQ() async {
  var url = Uri.parse('https://medsos-umkm.up.railway.app/adminfaq/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<FaqModel> listFAQ = [];
  for (var d in data) {
    if (d != null) {
      listFAQ.add(FaqModel.fromJson(d));
    }
  }
  return listFAQ;
}

showAlertDelete(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Login"),
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => LoginPage()
      ),);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Gagal!"),
    content: Text("Anda perlu Login terlebih dahulu!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}