import 'package:flutter/material.dart';
import 'package:pas/models/forum_model.dart';
import 'package:pas/pages/reply_page.dart';
import 'package:pas/pages/form_forum.dart';
import 'package:pas/widget/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var detailForum = [];

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum UMKM'),
      ),
      drawer: const Drawers(),
        
      body: FutureBuilder(
        future: Forum.fetchForum(),
        builder: (context, AsyncSnapshot snapshot){
            if (snapshot.data == null){
                return const Center(child: CircularProgressIndicator());
            } else{
                if(!snapshot.hasData){
                    return Column(
                        children: const [
                            Text(
                                "Tidak ada forum",
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
                        itemBuilder: (_, index) => InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReplyPage(forumModel: snapshot.data![index])
                                ),
                            ),
                            child: Container(
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
                                            "${snapshot.data![index].fields.title}",
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        const SizedBox(height: 5),
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
                                    ],
                                ),
                            ),
                        )
                    );
                }
            }
        }
      ),
    floatingActionButton: Padding(
        padding : const EdgeInsets.fromLTRB(40,10,10,10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(

            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton.extended(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormForum()
                      ),
                    ),
                label: const Text('Buat Forum'),
                icon: const Icon(Icons.add),
                ),
            ),
          ],
        )
        //child: Container(
        //),
    ),
    );
  }
}
