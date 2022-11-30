import 'package:flutter/material.dart';
import 'package:pas/models/forum_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormForum extends StatefulWidget {
    const FormForum({super.key});

    @override
    State<FormForum> createState() => _FormForumState();
}

class _FormForumState extends State<FormForum> {
    final _formKey = GlobalKey<FormState>();

    String _judul = "";
    String _pesan = "";

    Future<void> submit(BuildContext context, String idUser) async{
        String id = idUser;
        final response = await http.post(
            Uri.parse('https://medsos-umkm.up.railway.app/forum/add_forum_flutter/'+id),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, dynamic>){
                'title': _judul,
                'discussion': _pesan,
                'id': int.parse(id), 
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Tambah Forum'),
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [
                                Padding(
                                    // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Contoh: Kerja sama UMKM Ice Cream",
                                            labelText: "Judul",
                                            //icon: const Icon(Icons.),
                                            // Menambahkan circular border agar lebih rapi
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Menambahkan behavior saat nama diketik 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        // Validator sebagai validasi form
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Judul tidak boleh kosong!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),

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
                                            String id = widget.id;
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