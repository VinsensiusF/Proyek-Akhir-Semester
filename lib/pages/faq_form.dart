import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pas/widget/drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pas/models/faq_models.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pas/utils/utils.dart';
import 'package:http/http.dart' as http;

class MyFAQForm extends StatefulWidget {
  const MyFAQForm({super.key});

  @override
  State<MyFAQForm> createState() => _MyFAQFormState();
}

class _MyFAQFormState extends State<MyFAQForm> {
  final _formKey = GlobalKey<FormState>();
  String _pertanyaan = "";
  String _jawaban = "";

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
        )
      ),
    );
  }

}