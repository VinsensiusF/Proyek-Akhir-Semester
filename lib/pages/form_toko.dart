import 'package:pas/models/models_toko.dart';
import 'package:pas/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pas/pages/kategori_details_page.dart';

class TokoForm extends StatefulWidget {
  //final List<Budget> data;
  //const BudgetForm({Key? key,required this.data,}) : super(key: key);
  const TokoForm({super.key});

  @override
  State<TokoForm> createState() => _TokoFormState();
}

class _TokoFormState extends State<TokoForm> {
  final _formKey = GlobalKey<FormState>();
  String _namatoko = "";
  String _deskripsi = "";
  String _alamat = "";
  String _link = "";
  int _nomor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
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
                      hintText: "Contoh: Toko Flutter",
                      labelText: "Nama Toko",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _alamat = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _alamat = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama toko tidak boleh kosong!';
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
                      hintText: "Contoh: Makanan Enak",
                      labelText: "Deeskripsi",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
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
                      hintText: "Contoh: Di Sini",
                      labelText: "Alamat",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _alamat = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _alamat = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat tidak boleh kosong!';
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
                      hintText: "Contoh: https",
                      labelText: "Link Toko",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _link = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _link = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Link Toko tidak boleh kosong!';
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
                      hintText: "Contoh: 081234567891",
                      labelText: "Kontak",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nomor = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nomor = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Kontak tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // Save button
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DataToko.tambahToko(
                          namatoko: _namatoko,
                          deskripsi: _deskripsi,
                          alamat: _alamat,
                          nomor: _nomor,
                          link: _link);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyKategoriDetailPage()),
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
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
