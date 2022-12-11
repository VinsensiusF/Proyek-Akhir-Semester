import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pas/widget/drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pas/models/faq_models.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pas/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:pas/pages/faq_page.dart';

class MyFAQForm extends StatefulWidget {
  const MyFAQForm({super.key});

  @override
  State<MyFAQForm> createState() => _MyFAQFormState();
}

class _MyFAQFormState extends State<MyFAQForm> {
  final _formKey = GlobalKey<FormState>();
  String _pertanyaan = "";
  String _jawaban = "";
  int count = 0;

  void _incrementClicked() {
    setState(() {
      count++;
    });
  }


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    String url2 = "https://medsos-umkm.up.railway.app/adminfaq/create_faq_flutter/";
    print(request.cookies);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FAQ"),
      ),
      drawer: const Drawers(),
      body: Container(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: const Text(
                        'Tambahkan Pertanyaan',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      )),
                  SizedBox(height: 30, width: 30,),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Apa itu SellerPrism.io?",
                      icon: Icon(Icons.question_mark_outlined),
                      labelText: "Pertanyaan",
                      border: OutlineInputBorder(),
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
                        return 'Pertanyaan tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30, width: 30,),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "SellerPrism.io merupakan aplikasi ...",
                      labelText: "Jawaban",
                      icon: Icon(Icons.question_answer_outlined),
                      border: OutlineInputBorder(),
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
                  SizedBox(height: 30, width: 30,),
                  Container(
                    width: 100,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.blue),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            postDummy(request, url2);
                            Timer(Duration(seconds:3),() async {
                              const url =
                                  "https://medsos-umkm.up.railway.app/adminfaq/create_faq_flutter/";
                              final response = await request.post(url, {
                                "question": _pertanyaan,
                                "answer": _jawaban,
                              });
                              if (request.cookies != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyFAQPage()),
                                );
                              }
                            });
                          }
                        },
                        child: const Text("Submit")),
                  ),
                ],
              ),
            ),
          )
      ),
      floatingActionButton: Padding(
          padding : const EdgeInsets.fromLTRB(40,10,10,10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFAQPage()
                    ),
                  ),
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

void postDummy(CookieRequest request, String url2) async {
  final response2 =  await request.post(url2, {
    "question":"",
    "answer": "",
  });
}