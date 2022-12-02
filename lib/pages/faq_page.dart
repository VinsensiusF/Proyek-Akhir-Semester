import 'package:flutter/material.dart';
import 'package:pas/widget/drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pas/models/faq_models.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:http/http.dart' as http;

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
                              ),
                            ));
                  }
                }
              },
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Pertanyaan",
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _pertanyaan = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _pertanyaan = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama post tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Jawaban",
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _jawaban = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _jawaban = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Jawaban tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                    TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            const AlertDialog(
                              title: Text("POST BERHASIL"),
                              content: Text("FAQ DITAMBAHKAN"),
                            );
                            const url =
                                "https://medsos-umkm.up.railway.app/adminfaq/create_faq_flutter";
                            final response = await request.post(url, {
                              "question": _pertanyaan,
                              "answer": _jawaban,
                            });
                          }
                        },
                        child: const Text("Submit")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
