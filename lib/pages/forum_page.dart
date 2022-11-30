import 'package:flutter/material.dart';
import 'package:Proyek-Akhir-Semester/model/forum_model.dart';
import 'package:Proyek-Akhir-Semester/page/reply_page.dart';


//belum tambahin tombol untuk add forum, cara pisahin dari futurebuilder?

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
        title: const Text('Forum'),
      ),
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
                                    color: Color(Colors.black),
                                    fontsize: 20
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
                                //padding: const EdgeInsets.all(),
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
                                        Text(
                                            "${snapshot.data![index].fields.username} | ${snapshot.data![index].fields.time}",
                                            style: const TextStyle(
                                                fontSize: 10.0,
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
    )
  }
}
