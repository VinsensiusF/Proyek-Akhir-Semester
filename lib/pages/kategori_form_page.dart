import 'package:pas/main.dart';
import 'package:pas/pages/kategori_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pas/widget/drawer.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

class MyKategoriFormPage extends StatefulWidget {
  const MyKategoriFormPage({super.key});

  @override
  State<MyKategoriFormPage> createState() => _TambahKategoriPageState();
}

class Kategori {
  late String kategori;
  late String deskripsi;
  late String url_file;

  Kategori(
      {required this.kategori, required this.deskripsi, required this.url_file});
}

class _TambahKategoriPageState extends State<MyKategoriFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _kategori;
  String? deskripsi;
  String? file_url;

  // onPressed(BuildContext context) {
  //   var data = Kategori(kategori: _kategori!, deskripsi: deskripsi!,);
  //   globals.kategori.add(data);
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const MyKategoriPage()),
  //   );
  // }

  Future<void> onPressed(BuildContext context) async{
        final response = await http.post(
            Uri.parse('https://medsos-umkm.up.railway.app/addkategori/create_kategori_flutter/'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
                'nama': _kategori,
                'deskripsi': deskripsi,
                'file_url': file_url,
            })
        );
            Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyKategoriPage()),
    );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Kategori'),
      ),
      drawer: const Drawers(),
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
                      hintText: "Contoh: Pendidikan",
                      labelText: "Kategori",
                       // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.category),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _kategori = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _kategori = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Kategori tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Kategori ini adalah kategori terbaik",
                      labelText: "Deskripsi",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.description),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value != '') {
                          deskripsi = value!;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (value != '') {
                          deskripsi = value!;
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: https://ditpsd.kemdikbud.go.id/upload/gallery/foto/fri-oct-30-2020-1029-am34426.jpg",
                      labelText: "Link Gambar",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.image),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value != '') {
                          file_url = value!;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (value != '') {
                          file_url = value!;
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Link Gambar tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(16.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                          onPressed(context);
                      }
                    },
                    child: const Text( "Simpan Kategori", style: TextStyle(color: Colors.white )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}