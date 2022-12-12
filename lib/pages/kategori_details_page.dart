import 'package:flutter/material.dart';
import 'package:pas/pages/form_toko_baru.dart';
import 'package:pas/pages/kategori_page.dart';
import 'package:pas/widget/drawer.dart';
import 'package:url_launcher/link.dart';
import 'package:pas/models/models_kategori.dart';
import 'package:pas/models/models_toko_json.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyKategoriDetailPage extends StatelessWidget {
  final Kategori kategori;
  MyKategoriDetailPage({Key? key, required this.kategori});

  List<Toko> list = <Toko>[];
  List<Toko> nampungkategori = <Toko>[];

  @override
  Future<List<Toko>> fetchToko() async {
    var url =
        Uri.parse('https://medsos-umkm.up.railway.app/addproductjsonall/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // print(data);

    List<Toko> listToko = [];
    for (var d in data) {
      if (d != null) {
        listToko.add(Toko.fromJson(d));
        list.add(Toko.fromJson(d));
      }
    }
    return listToko;
  }

  isikategori(List<Toko> isitoko) {
    for (var res in isitoko) {
      if (res.fields.kategoriProduk.toString().toLowerCase() ==
          kategori.fields.nama.toLowerCase()) {
        nampungkategori.add(res);
      }
    }
    // print(nampungkategori);
    return nampungkategori;
  }

  tampilan(List<Toko> card) {
    // print(card);
    if (card.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Mohon maaf. Belum ada toko dan produk yang tersedia:(")
        ],
      );
    } else {
      return ListView(children: <Widget>[
        GestureDetector(
            child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 146, 161, 235),
                  borderRadius: BorderRadius.circular(17.0),
                  boxShadow: const [
                    BoxShadow(color: Colors.deepPurple, blurRadius: 3.0)
                  ],
                ),
                child: Column(
                    children: nampungkategori.isNotEmpty
                        ? nampungkategori
                            .map((toko) => Card(
                                color: Color.fromARGB(255, 205, 225, 234),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${toko.fields.namaProduk}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.blue[500],
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            "${toko.fields.gambarProduk}"),
                                      ),
                                      Text(
                                        "${toko.fields.kategoriProduk}",
                                        style: const TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Divider(
                                        color: Color.fromARGB(255, 72, 47, 141),
                                        thickness: 1,
                                      ),
                                      Text(
                                        "${toko.fields.deskripsiProduk}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 76, 37, 184),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Link(
                                          target: LinkTarget.blank,
                                          uri: Uri.parse(
                                              "${toko.fields.linkProduk}"),
                                          builder: (context, followLink) =>
                                              ElevatedButton(
                                                onPressed: followLink,
                                                child: Text('Beli di sini'),
                                              )),
                                      Text(
                                        "Rp${toko.fields.hargaProduk}",
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ])))
                            .toList()
                        : [
                            Center(
                                child: Column(children: const [
                              Text(
                                "Mohon maaf. Belum ada toko dan produk yang tersedia:(",
                                style: TextStyle(fontSize: 16),
                              ),
                            ]))
                          ])))
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko'),
        backgroundColor: Color.fromARGB(255, 146, 161, 235),
        centerTitle: true,
      ),
      drawer: const Drawers(),
      body: FutureBuilder(
          future: fetchToko(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada toko :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              } else {
                isikategori(list);
                return tampilan(nampungkategori);
              }
            }
          }),
      floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyKategoriPage()),
                    ),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TokoForm()),
                    ),
                    label: const Text('Ayo Jualan'),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ])),
    );
  }
}
