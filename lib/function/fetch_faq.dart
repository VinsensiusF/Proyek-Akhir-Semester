import 'package:pas/models/faq_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<FaqModel>> fetchToDo() async {
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