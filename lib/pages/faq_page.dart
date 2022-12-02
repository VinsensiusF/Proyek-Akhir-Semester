import 'package:flutter/material.dart';
import 'package:pas/widget/drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pas/models/faq_models.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:http/http.dart' as http;
import 'package:pas/pages/faq_form.dart';

class MyFAQPage extends StatefulWidget {
  const MyFAQPage({super.key});

  @override
  State<MyFAQPage> createState() => _MyFAQPageState();
}

class _MyFAQPageState extends State<MyFAQPage> {
  final _formKey = GlobalKey<FormState>();
  String _pertanyaan = "";
  String _jawaban = "";

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

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FAQ"),
      ),
      drawer: const Drawers(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              FutureBuilder(
                future: fetchToDo(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada to do list :(",
                            style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: GFAccordion(
                              title: snapshot.data![index].fields.question,
                              content: snapshot.data![index].fields.answer,
                              titleBorder: Border.all(),
                              titlePadding: EdgeInsets.all(18.0),
                              contentPadding: EdgeInsets.all(20.0),
                              titleBorderRadius: BorderRadius.circular(20),
                              collapsedTitleBackgroundColor: Colors.white10,
                            ),
                          ));
                    }
                  }
                },
              ),
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton.extended(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFAQForm()
                    ),
                  ),
                  label: const Text('Buat FAQ'),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
