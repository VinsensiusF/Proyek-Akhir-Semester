import 'package:pas/models/profile_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pas/utils/utils.dart';

Future<List<Profile>> fetchProfile() async {
// Future<List<Profile>> fetchProfile(CookieRequest request) async {
  // String uname = request.username;
  // var url = Uri.parse('https://medsos-umkm.up.railway.app/json/$uname');
  var url = Uri.parse('https://medsos-umkm.up.railway.app/json/Andi123');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // Melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // Melakukan konversi data json menjadi object Kategori
  List<Profile> listProfile = [];
  for (var d in data) {
    if (d != null) {
      listProfile.add(Profile.fromJson(d));
    }
  }

  return listProfile;
}

