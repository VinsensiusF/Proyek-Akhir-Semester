import 'package:flutter/material.dart';
import 'package:pas/models/reply_model.dart';
import 'package:pas/models/forum_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormReply extends StatefulWidget {
    const FormReply({Key? key, required this.forumModel}) : super(key: key);

    final Forum forumModel;

    @override
    State<FormReply> createState() => _FormReplyState(forumModel);
}

class _FormReplyState extends State<FormReply> {
    Forum model;
    _FormReplyState(this.model);

    final _formKey = GlobalKey<FormState>();

    String _pesan = "";

    Future<void> submit(BuildContext context, String idUser) async{
        String id = idUser;
        int forum_pk = model.pk;
        final response = await http.post(
            //bisa ngga pass model forum lewat sini --> untuk foreignkey
            Uri.parse('https://medsos-umkm.up.railway.app/forum/add_reply_flutter/'+id),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
                'discussion': _pesan,
                'id': int.parse(id), 
                'forum_pk': forum_pk,
            })
        );
    }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Reply'),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      children: [
                          //Pesan
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Tuliskan pesan Anda di sini",
                                      labelText: "Pesan",
                                      //icon: const Icon(Icons.),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          _pesan = value!;
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                      setState(() {
                                          _pesan = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Pesan tidak boleh kosong!';
                                      }
                                      return null;
                                  },
                              ),
                          ),
                          //https://api.flutter.dev/flutter/material/TextField-class.html
                          TextButton(
                              child: const Text(
                                  "Simpan",
                                  style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    //masih dummy --> fix this
                                      String id = '1';//widget.id;
                                      submit(context, id);
                                  }
                              },
                          ),
                          
                      ],
                  ),
              ),
          ),
      ),
    );
  }
}