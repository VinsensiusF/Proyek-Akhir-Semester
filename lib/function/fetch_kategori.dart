import 'package:pas/models/models_kategori.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Kategori>> fetchKategori() async {
  var url = Uri.parse('https://medsos-umkm.up.railway.app/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Kategori
  List<Kategori> listKategori = [];
  for (var d in data) {
    if (d != null) {
      listKategori.add(Kategori.fromJson(d));
    }
  }

  return listKategori;
}