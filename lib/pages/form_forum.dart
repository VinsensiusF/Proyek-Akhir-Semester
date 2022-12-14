import 'package:flutter/material.dart';
import 'package:pas/models/forum_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pas/pages/forum_page.dart';
import 'package:pas/utils/utils.dart';
import 'package:provider/provider.dart';

class FormForum extends StatefulWidget {
    FormForum({Key? key}) : super(key: key);

    @override
    State<FormForum> createState() => _FormForumState();
}

class _FormForumState extends State<FormForum> {
    final _formKey = GlobalKey<FormState>();

    String _judul = "";
    String _pesan = "";

    CookieRequest request = CookieRequest();
    String username = "";
    bool loggedIn = false;

    @override
    void initState() {
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final _request = Provider.of<CookieRequest>(context, listen: false);

        print("tes");

        if (!_request.loggedIn) {
            print("tas");
        } else {
            setState(() {
                request = _request;
                username = _request.username;
                loggedIn = _request.loggedIn;
                print("tos");
                print(username);
            });
        }
        });
    }

    Future<void> submit(BuildContext context, String idUser) async{
        String userId = idUser;
        final response = await http.post(
            Uri.parse('https://medsos-umkm.up.railway.app/forum/add_forum_flutter/'+userId),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
                'title': _judul,
                'discussion': _pesan,
                'id': int.parse(userId), 
            })
        );
    }

    @override
    Widget build(BuildContext context) {
        //CookieRequest request = CookieRequest();
        //final _request = Provider.of<CookieRequest>(context, listen: false);
        //final request = context.watch<CookieRequest>();
        //username = request.username;
        print("---");
        print(username);
        print("---");
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
                                //Image.asset(
                                //    'lib/assets/forum.jpg',
                                //    width: 400,
                                //    height: 225,
                                //),
                                Padding(
                                    // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Contoh: Kerja sama UMKM Ice Cream",
                                            labelText: "Judul",
                                            icon: const Icon(Icons.title_rounded),
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
                                            icon: const Icon(Icons.message_rounded),
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
                                            //masih dummy --? fix this
                                            String id = '45';//widget.id;
                                            //String id = widget.id;
                                            submit(context, id);
                                            showDialog(
                                                context: context,
                                                builder: (context){
                                                    return Dialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        elevation: 15,
                                                        child: Container(
                                                            child: ListView(
                                                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                                                shrinkWrap: true,
                                                                children: <Widget> [
                                                                    SizedBox(height: 20),
                                                                    Text(
                                                                        'Forum berhasil dibuat!',
                                                                        textAlign: TextAlign.center,
                                                                    ),
                                                                    SizedBox(height: 20),
                                                                    TextButton(
                                                                        onPressed: () {
                                                                            Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => ForumPage()));
                                                                        },
                                                                        child: Text('Kembali'),
                                                                    ), 
                                                                ],
                                                            ),
                                                        ),
                                                    );
                                                },
                                            );
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