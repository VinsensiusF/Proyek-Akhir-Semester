import 'package:pas/main.dart';
import 'package:pas/pages/kategori_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pas/widget/drawer.dart';
import '../models/global.dart' as globals;

class MyKategoriFormPage extends StatefulWidget {
  const MyKategoriFormPage({super.key});

  @override
  State<MyKategoriFormPage> createState() => _TambahKategoriPageState();
}

class Kategori {
  late String kategori;
  late String deskripsi;

  Kategori(
      {required this.kategori, required this.deskripsi});
}

class _TambahKategoriPageState extends State<MyKategoriFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _kategori;
  String? deskripsi;

  onPressed(BuildContext context) {
    var data =
        Kategori(kategori: _kategori!, deskripsi: deskripsi!,);
    globals.kategori.add(data);
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