import 'package:pas/models/models_toko_json.dart';
import 'package:pas/pages/kategori_details_page.dart';
import 'package:pas/pages/kategori_page.dart';
import 'package:pas/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pas/utils/utils.dart';
import 'package:provider/provider.dart';

class TokoForm extends StatefulWidget {
  const TokoForm({super.key});

  @override
  State<TokoForm> createState() => _TokoFormState();
}

class _TokoFormState extends State<TokoForm> {
  final _formKey = GlobalKey<FormState>();
  String _nama = "";
  String _kategori = "";
  String _deskripsi = "";
  String _linktoko = "";
  String _gambar = "";
  int _harga = 0;

  void submit(
      request, _nama, _kategori, _deskripsi, _linktoko, _gambar, _harga) async {
    await request.post(
        'https://medsos-umkm.up.railway.app/addproduct/create_product_flutter/',
        {
          'nama_produk': _nama,
          'kategori_produk': _kategori,
          'harga_produk': _harga,
          'gambar_produk': _gambar,
          'deskripsi_produk': _deskripsi,
          'link_produk': _linktoko,
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Toko'),
      ),
      // Menambahkan drawer menu
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
                  // Form Judul
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Toko Jaya",
                      labelText: "Nama Toko",
                      icon: const Icon(Icons.shop),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nama = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nama = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pilih kategori!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  // Form Judul
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Makanan",
                      labelText: "Kategori",
                      icon: const Icon(Icons.category),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat diketik
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
                        return 'Pilih kategori!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  // Form Judul
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Rendang enak dan empuk.",
                      labelText: "Deskripsi",
                      icon: const Icon(Icons.description),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat diketik
                    onChanged: (String? value) {
                      setState(() {
                        _deskripsi = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _deskripsi = value!;
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
                  // Form Judul
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText:
                          "Contoh: https://shopee.co.id/rendangpj?smtt=0.74188324-1670662290.9",
                      labelText: "Link Toko",
                      icon: const Icon(Icons.link),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat diketik
                    onChanged: (String? value) {
                      setState(() {
                        _linktoko = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _linktoko = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Link toko tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  // Form Judul
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Gambar terkait toko",
                      labelText: "Link Gambar",
                      icon: const Icon(Icons.picture_in_picture),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat diketik
                    onChanged: (String? value) {
                      setState(() {
                        _gambar = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _gambar = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Gambar harus diisi!';
                      }
                      return null;
                    },
                  ),
                ),
                // Form Nominal
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  // Form Nominal
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 100000",
                      labelText: "Harga",
                      icon: const Icon(Icons.price_change),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat diketik
                    onChanged: (String? value) {
                      setState(() {
                        _harga = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _harga = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi harga produk!!';
                      }
                      return null;
                    },
                  ),
                ),

                // Save button
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
                        submit(request, _nama, _kategori, _deskripsi, _linktoko,
                            _gambar, _harga.toString());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyKategoriPage()),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
