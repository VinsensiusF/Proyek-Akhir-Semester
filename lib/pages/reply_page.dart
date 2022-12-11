import 'package:flutter/material.dart';
import 'package:pas/models/forum_model.dart';
import 'package:pas/pages/forum_page.dart';
import 'package:pas/models/reply_model.dart';
import 'package:pas/pages/form_reply.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pas/widget/drawer.dart';

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
      //drawer: const Drawers(),
      //judul
      //username | waktu
      //pesan
      //tombol reply di pojok kanan
      //https://api.flutter.dev/flutter/material/Card-class.html 
      body: FutureBuilder(
        future: Reply.fetchReply('${model.pk}'),
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.data == null){
            return const Center(child: CircularProgressIndicator());
          } else{
              if(!snapshot.hasData){
                  return Column(
                      children: const [
                          Text(
                              "Tidak ada reply",
                              style: TextStyle(
                                  color: Color(0xff59A5D8),
                                  fontSize: 20
                              ),
                          ),
                          SizedBox(height: 10),
                      ],
                  );
              } else{
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical:15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17.0),
                          boxShadow: const[
                              BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 3.0
                              )
                          ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${snapshot.data![index].fields.username} | ${snapshot.data![index].fields.time}",
                              style: const TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.grey,
                              ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                              "${snapshot.data![index].fields.discussion}",
                              style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                              ),
                          ),
                          const SizedBox(height: 10),   
                        ]
                      ),
                    ),
                  );
              }
          }
        },
      ),


      floatingActionButton: Padding(
        padding : const EdgeInsets.fromLTRB(40,10,10,10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              //alignment: Alignment.bottomLeft,
              //child: TextButton(
              //  onPressed: (){
              //    Navigator.pop(context);
              //  },
              //  child: Text(
              //    "Kembali",
              //  ),
              //  style: TextButton.styleFrom(
              //      backgroundColor: Colors.blue,
              //      primary: Colors.white,
              //  ),
              //),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormReply(forumModel: model)
                  ),
                ),
                label: const Text('Reply'),
                icon: const Icon(Icons.message),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
