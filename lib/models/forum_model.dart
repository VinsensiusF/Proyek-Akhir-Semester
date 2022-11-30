// To parse this JSON data, do
//
//     final forum = forumFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

List<Forum> forumFromJson(String str) => List<Forum>.from(json.decode(str).map((x) => Forum.fromJson(x)));

String forumToJson(List<Forum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Forum {
    Forum({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Forum.fromJson(Map<String, dynamic> json) => Forum(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };

    static Future<List<Forum>> fetchForum() async {
        //tanyain kalo mau get per-kategori gimana? masukin link-nya parameternya gimana
        //buat dropdown-nya
        var url = Uri.parse('https://medsos-umkm.up.railway.app/forum/json/semua'); 
        var response = await http.get(
            url,
            headers: {
                "Access-Control-Allow-Origin": "*",
                "Content-Type": "application/json",
            },
        );

        var data = jsonDecode(utf8.decode(response.bodyBytes));

        List<Forum> forum = [];
            for (var d in data) {
                if (d != null) {
                    forum.add(Forum.fromJson(d));
                }
            }
        return forum;
    }
}

class Fields {
    Fields({
        required this.title,
        required this.discussion,
        required this.time,
        required this.user,
        required this.username,
        required this.kategori,
    });

    String title;
    String discussion;
    DateTime time;
    int user;
    String username;
    String kategori;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        discussion: json["discussion"],
        time: DateTime.parse(json["time"]),
        user: json["user"],
        username: json["username"],
        kategori: json["kategori"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "discussion": discussion,
        "time": time.toIso8601String(),
        "user": user,
        "username": username,
        "kategori": kategori,
    };
}
