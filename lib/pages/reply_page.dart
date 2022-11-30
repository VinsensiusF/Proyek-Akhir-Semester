import 'package:flutter/material.dart';
import 'package:Proyek-Akhir-Semester/model/forum_model.dart';
import 'package:Proyek-Akhir-Semester/page/forum_page.dart';
import 'package:Proyek-Akhir-Semester/model/reply_model.dart';
import 'package:Proyek-Akhir-Semester/page/form_reply.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReplyPage extends StatefulWidget {
  const ReplyPage({Key? key, required this.forumModel}) : super(key: key);
  final Forum forumModel;

  @override
  State<ReplyPage> createState() => _ReplyPageState(forumModel);
}

class _ReplyPageState extends State<ReplyPage> {
  Forum model;
  _ReplyPageState(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum Diskusi'),
      ),
      //judul
      //username | waktu
      //pesan
      //tombol reply di pojok kanan
      body: Column(
        children:[
          Padding(
            padding const EdgeInsets.all(8.0),
            child: Column(
              children:[
                Text(
                  model.fields.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  '${model.fields.username} | ${model.fields.time}',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 7),
                ),
                Text(
                  model.fields.discussion,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Kembali",
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormReply(forumModel: snapshot.data![index])
                      ),
                    ),
                    child: Text(
                      "Reply",
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 17),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
