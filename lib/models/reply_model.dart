// To parse this JSON data, do
//
//     final reply = replyFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas/models/forum_model.dart';

List<Reply> replyFromJson(String str) => List<Reply>.from(json.decode(str).map((x) => Reply.fromJson(x)));

String replyToJson(List<Reply> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reply {
    Reply({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.discussion,
        required this.user,
        required this.username,
        required this.time,
        required this.forum,
    });

    String discussion;
    int user;
    String username;
    DateTime time;
    int forum;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        discussion: json["discussion"],
        user: json["user"],
        username: json["username"],
        time: DateTime.parse(json["time"]),
        forum: json["forum"],
    );

    Map<String, dynamic> toJson() => {
        "discussion": discussion,
        "user": user,
        "username": username,
        "time": time.toIso8601String(),
        "forum": forum,
    };
}
